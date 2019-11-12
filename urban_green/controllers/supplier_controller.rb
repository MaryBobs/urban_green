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

get '/suppliers/:id/edit' do
  @supplier = Supplier.find_by_id(params['id'])
  erb(:"suppliers/edit")
end

get '/suppliers/:id/delete' do
  @supplier = Supplier.find_by_id(params['id'])
  erb(:"suppliers/delete")
end

post '/suppliers' do
  Supplier.new(params).save
  redirect to '/suppliers'
end

post '/suppliers/:id' do
  Supplier.new(params).update
  redirect to "/suppliers/#{params['id']}"
end

post '/suppliers/:id/delete' do
  Supplier.find_by_id(params['id']).delete
  redirect to '/suppliers'
end
