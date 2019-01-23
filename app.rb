require('sinatra')
require('sinatra/reloader') if development?
require('pry')
require_relative('controllers/merchants_controller')
require_relative('controllers/purchases_controller')
require_relative('controllers/users_controller')
also_reload('../models/*')
set :public_folder, 'public'

get '/' do
  erb(:index)
end

error 404 do
  erb(:error)
end
# INDEX



# NEW
# get '/existing/:id' do
#   # show everything in database related to user :id
#
#   erb( :existing )
# end
#
# # CREATE
# post '/new' do
#   # Create a new User object
#
#   # Save it to the DB
#   # Redirect the browser to '/existing'
#   redirect to '/existing/:id' - take :id from new user
# end
#
#
# # EDIT
# get '/users/:id/edit' do # edit
#   ?? edit - ??
#   erb( :edit )
# end
#
# # UPDATE
# update what/where?
# end
#
# # DESTROY
# destroy what, on what page?
#   redirect to overview
# end
