require('sinatra')
require('sinatra/contrib/all')
require_relative("../models/stock.rb")
require_relative("../models/product.rb")
require_relative("../models/supplier.rb")
require_relative("../models/category.rb")
also_reload("../models/*")

get '/stock' do
  @stock = Stock.all()
  @categories = Category.all()
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

get '/stock/:id/delete' do
  @stock = Stock.find_by_id(params['id'])
  erb(:"stock/delete")
end

post '/stock' do
  Stock.new(params).save
  redirect to '/stock'
end

post '/stock/:id' do
  Stock.new(params).update
  redirect to "/stock"
end

post '/stock/:id/delete' do
  Stock.find_by_id(params['id']).delete
  redirect to '/stock'
end
