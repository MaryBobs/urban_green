require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/supplier_controller.rb')
require_relative('controllers/product_controller.rb')

get '/' do
  erb(:index)
end
