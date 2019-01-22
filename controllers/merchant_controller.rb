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
  # @merchant = Merchant.find(params)
 erb(:"merchants/index")
end

post '/merchant' do
  Merchant.new(params).save
  redirect '/existing'
end

# get '/merchant/:id' do
#  erb(:"merchants/edit")
# end

# post '/merchant' do
#   merchant.delete
#   redirect '/existing'
# end
