require('sinatra')
require('sinatra/reloader') if development?
require('pry')
require_relative('../models/merchant.rb')
require_relative('../models/purchase.rb')
require_relative('../models/user.rb')
also_reload('../models/*')
set :public_folder, 'public'

get '/new' do
  erb(:"user/new")
end

post '/new' do
  User.new(params).save
  redirect '/existing'
end

get '/existing' do
  @all_users = User.all
  erb(:"user/existing")
end

get '/existing/:id' do
  @user = User.find(params['id'])

  erb(:"user/user")
end

post '/existing' do
  User.delete(params['id'])
  redirect "/"
end

get '/edit/:id' do
  @user = User.find(params['id'])
  erb(:"user/edit")
end

post '/delete' do # delete
  User.delete_all
  redirect to '/existing'
end

#  post '/edit' do
#   @user.update
#   @user.save
#   redirect to '/existing'
# end
