require_relative("../db/sql_runner.rb")

class Stock

attr_reader :id
attr_accessor :product_id, :supplier_id, :stock_quantity, :buying_cost, :selling_price

def initialize(options)
  @id = options['id'].to_i if options['id']
  @product_id = options['product_id'].to_i
  @supplier_id = options['supplier_id'].to_i
  @stock_quantity = options['stock_quantity'].to_i
  @buying_cost = options['buying_cost']
  @selling_price = options['selling_price']
end

def save()
  sql = "INSERT INTO stock (product_id, supplier_id, stock_quantity, buying_cost, selling_price)
  VALUES ($1, $2, $3, $4, $5) RETURNING id"
  values = [@product_id, @supplier_id, @stock_quantity, @buying_cost, @selling_price]
  @id = SqlRunner.run(sql,values)[0]['id'].to_i
end

end
