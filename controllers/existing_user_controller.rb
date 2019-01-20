require('sinatra')
require('sinatra/reloader') if development?
require('pry')
require_relative('../models/merchant.rb')
require_relative('../models/purchase.rb')
require_relative('../models/user.rb')
also_reload('../models/*')

get '/existing' do
  @all_users = User.all
  erb(:"existing/index")
end

get '/existing/:id' do
  @user = User.find(params['id'])
  erb(:"existing/overview")
end

# get '/user/:id' do
#   # Retrieve one pizza order from the db
#   @pizza_order = PizzaOrder.find( params[:id] )
#   # Display the details of that order
#   erb( :show )
# end
