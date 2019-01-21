require('sinatra')
require('sinatra/reloader') if development?
require('pry')
require_relative('../models/merchant.rb')
require_relative('../models/purchase.rb')
require_relative('../models/user.rb')
also_reload('../models/*')

get '/new' do
  erb(:"new/index")
end

post '/new' do
  User.new(params).save
  redirect to '/existing'
end

get '/existing' do
  @all_users = User.all
  erb(:"existing/existing")
end

get '/existing/:id' do
  @user = User.find(params['id'])
  erb(:"existing/user")
end

post '/add' do
  Purchase.new(params).save
  redirect to '/existing'
end
# get '/user/:id' do
#   # Retrieve one pizza order from the db
#   @pizza_order = PizzaOrder.find( params[:id] )
#   # Display the details of that order
#   erb( :show )
# end
