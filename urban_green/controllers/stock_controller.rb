require('sinatra')
require('sinatra/contrib/all')
require_relative("../models/stock.rb")
require_relative("../models/product.rb")
require_relative("../models/supplier.rb")
also_reload("../models/*")

get '/stock' do
  @stock = Stock.all()
  erb(:'stock/index')
end

get '/stock/new' do
  @products = Product.all()
  @suppliers = Supplier.all()
  erb(:'stock/new')
end

get '/stock/:id/edit' do
  @stock = Stock.find_by_id(params['id'])
  @products = Product.all()
  @suppliers = Supplier.all()
  erb(:"stock/edit")
end


post '/stock' do
  Stock.new(params).save
  redirect to '/stock'
end

post '/stock/:id' do
  Stock.new(params).update
  redirect to "/stock"
end
