require('sinatra')
require('sinatra/contrib/all')
require_relative("../models/supplier.rb")
also_reload("../models/*")

get '/suppliers' do
  @suppliers = Supplier.all()
  erb(:"suppliers/index")
end

get '/suppliers/new' do
  erb(:"suppliers/new")
end

get '/suppliers/:id' do
  @supplier = Supplier.find_by_id(params['id'])
  erb(:'suppliers/show')
end

# get '/suppliers/:id/edit' do
#   @supplier = Supplier.find_by_id(params['id'])
#   erb(:"suppliers/edit")
# end

post '/suppliers' do
  Supplier.new(params).save
  redirect to '/suppliers'
end
