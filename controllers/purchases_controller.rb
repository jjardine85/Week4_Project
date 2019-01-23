require('sinatra')
require('sinatra/reloader') if development?
require('pry')
require_relative('../models/merchant.rb')
require_relative('../models/purchase.rb')
require_relative('../models/user.rb')
also_reload('../models/*')
set :public_folder, 'public'

get '/purchases' do
  erb(:"purchase/add")
end

get '/purchases/:id' do
  @user = User.find(params['id'])
  @merchant = Merchant.all
  erb(:"purchase/add")
end

post '/purchases' do
  puts params
  Purchase.new(params).save
  redirect to '/users/existing'
end
