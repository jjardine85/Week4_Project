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

# post '/add' do
#   binding.pry
#   Purchase.new(params).save
#   erb(:"existing/add")
#   redirect to '/existing'
# end
# get '/user/:id' do
#   # Retrieve one pizza order from the db
#   @pizza_order = PizzaOrder.find( params[:id] )
#   # Display the details of that order
#   erb( :show )
# end
