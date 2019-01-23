require('sinatra')
require('sinatra/reloader') if development?
require('pry')
require_relative('../models/merchant.rb')
require_relative('../models/purchase.rb')
require_relative('../models/user.rb')
also_reload('../models/*')
set :public_folder, 'public'

get '/merchant' do
  @merchants = Merchant.all

 erb(:"merchants/index")
end

post '/merchant' do
  Merchant.new(params).save
  redirect '/existing'
end

get '/merchant/:id' do
  erb(:"merchants/edit")
end

post '/merchant/:id' do
  Merchant.delete
  redirect '/existing'
end

post '/delete-merchants' do # delete
  Merchant.delete_all
  redirect to '/existing'
end
