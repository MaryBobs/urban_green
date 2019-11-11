require('sinatra')
require('sinatra/contrib/all')
require_relative("../models/product.rb")
also_reload("../models/*")

get '/products' do
  @products = Product.all()
  @suppliers = Supplier.all()
  erb(:'products/index')
end
