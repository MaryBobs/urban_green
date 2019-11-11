require('sinatra')
require('sinatra/contrib/all')
require_relative("../models/product.rb")
require_relative("../models/supplier.rb")
require_relative("../models/category.rb")
also_reload("../models/*")

get '/products' do
  @products = Product.all()
  @suppliers = Supplier.all()
  erb(:'products/index')
end

get '/products/new' do
  @categories = Category.all()
  @suppliers = Supplier.all()
  erb(:"products/new")
end

post '/products' do
  Product.new(params).save
  redirect to '/products'
end
