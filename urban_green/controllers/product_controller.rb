require('sinatra')
require('sinatra/contrib/all') if development?
require_relative("../models/product.rb")
require_relative("../models/supplier.rb")
require_relative("../models/category.rb")

get '/products' do
  @products = Product.all()
  @categories = Category.all()
  erb(:'products/index')
end

get '/products/new' do
  @categories = Category.all()
  erb(:"products/new")
end

get '/products/:id' do
  @product = Product.find_by_id(params['id'])
  erb(:'products/show')
end

get '/products/:id/edit' do
  @product = Product.find_by_id(params['id'])
  @categories = Category.all()
  erb(:"products/edit")
end

get '/products/:id/delete' do
  @product = Product.find_by_id(params['id'])
  erb(:"products/delete")
end

post '/products' do
  Product.new(params).save
  redirect to '/products'
end

post '/products/:id' do
  Product.new(params).update
  redirect to "/products/#{params['id']}"
end

post '/products/:id/delete' do
  Product.find_by_id(params['id']).delete
  redirect to '/products'
end
