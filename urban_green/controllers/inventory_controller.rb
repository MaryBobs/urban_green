require('sinatra')
require('sinatra/contrib/all')
require_relative("../models/product.rb")
require_relative("../models/supplier.rb")
also_reload("../models/*")

get '/inventory' do
  @products = Product.all()
  @suppliers = Supplier.all()
  erb(:'inventory/index')
end
