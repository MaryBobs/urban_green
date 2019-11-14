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

def supplier()
  sql = "SELECT * FROM suppliers WHERE id = $1"
  values = [@supplier_id]
  results = SqlRunner.run(sql, values)
  supplier_hash = results[0]
  supplier = Supplier.new(supplier_hash)
  return supplier
end

def product()
  sql = "SELECT * FROM products WHERE id = $1"
  values = [@product_id]
  results = SqlRunner.run(sql, values)
  product_hash = results[0]
  product = Product.new(product_hash)
  return product
end

def delete()
  sql = "DELETE FROM stock WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

def markup()
  profit = (@selling_price.to_f - @buying_cost.to_f)
  result = (profit / @buying_cost.to_f) * 100
  return result.round(2)
end

  def self.all()
    sql = "SELECT * FROM stock"
    return SqlRunner.run(sql).map{|stock| Stock.new(stock)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM stock WHERE id = $1"
    values = [id]
    return Stock.new(SqlRunner.run(sql, values)[0])
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
