require('sinatra')
require('sinatra/reloader') if development?
require('pry')
require_relative('models/merchant')
require_relative('models/purchase')
require_relative('models/user')
also_reload('models/*')


get '/' do
  erb(:home)
end

# INDEX
get '/new' do
  erb(:new)
end
#
get '/existing' do
  erb(:existing)
end
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
