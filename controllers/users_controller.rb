require('sinatra')
require('sinatra/reloader') if development?
require_relative('../models/merchant.rb')
require_relative('../models/purchase.rb')
require_relative('../models/user.rb')
set :public_folder, 'public'

get '/users/new' do
  erb(:"user/new")
end

post '/users/new' do
  User.new(params).save
  redirect '/users/existing'
end

get '/users/existing' do
  @all_users = User.all
  erb(:"user/existing")
end

get '/users/existing/:id' do
  @user = User.find(params['id'])

  erb(:"user/user")
end

post '/users/existing' do
  User.delete(params['id'])
  redirect "/"
end

get '/users/edit/:id' do
  @user = User.find(params['id'])
  erb(:"user/edit")
end

post '/users/delete' do # delete
  User.delete_all
  redirect to '/users/existing'
end

#  post '/edit' do
#   @user.update
#   @user.save
#   redirect to '/existing'
# end
