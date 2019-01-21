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
