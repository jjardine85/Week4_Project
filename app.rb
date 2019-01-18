require('sinatra')
require('sinatra/contrib/all') if development?
require('pry')
require_relative('models/merchant')
require_relative('models/purchase')
require_relative('models/user')
also_reload('models/*')
