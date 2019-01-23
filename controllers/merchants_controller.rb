require('sinatra')
require('sinatra/reloader') if development?
require('pry')
require_relative('../models/merchant.rb')
require_relative('../models/purchase.rb')
require_relative('../models/user.rb')
also_reload('../models/*')
set :public_folder, 'public'

get '/merchants' do
  @merchants = Merchant.all

 erb(:"merchants/index")
end

post '/merchants' do
  Merchant.new(params).save
  redirect '/users/existing'
end

get '/merchants/:id' do
  @merchant = Merchant.find(params['id'])
  erb(:"merchants/edit")
end

post '/merchants/:id' do
  Merchant.delete(params['id'])
  redirect '/merchants'
end

post '/delete-merchants' do # delete
  Merchant.delete_all
  redirect to '/users/existing'
end
