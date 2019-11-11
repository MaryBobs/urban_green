require('sinatra')
require('sinatra/contrib/all')
require_relative("../models/product.rb")
require_relative("../models/supplier.rb")
also_reload("../models/*")

get '/inventory' do
  @stock = Stock.all()
  @suppliers = Supplier.all()
  erb(:'stock/index')
end
