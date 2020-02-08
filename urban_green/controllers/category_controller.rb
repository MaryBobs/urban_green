require('sinatra')
require('sinatra/contrib/all') if development?
require_relative("../models/stock.rb")
require_relative("../models/product.rb")
require_relative("../models/supplier.rb")
require_relative("../models/category.rb")

get '/categories/:id' do
  @categories = Category.find_by_id(params['id'])
  @products = Product.all()
  erb(:"categories/show")
end
