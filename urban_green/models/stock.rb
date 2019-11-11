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

def update()
  sql = "UPDATE stock SET (product_id, supplier_id, stock_quantity, buying_cost, selling_price)
  = ($1, $2, $3, $4, $5) WHERE id = $6"
  values = [@product_id, @supplier_id, @stock_quantity, @buying_cost, @selling_price, @id]
  SqlRunner.run(sql, values)
end

def self.all()
  sql = "SELECT * FROM stock"
  return SqlRunner.run(sql).map{|stock| Stock.new(stock)}
end

  def self.delete_all()
    sql = "DELETE FROM stock"
    SqlRunner.run(sql)
  end

  def self.delete_by_id(id)
    sql = "DELETE FROM stock WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

end
