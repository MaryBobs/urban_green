require_relative("../db/sql_runner.rb")

class Product

  attr_reader :id
  attr_accessor :name, :description, :supplier_id, :category_id, :stock_quantity,
  :buying_cost, :selling_price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @description = options['description']
    @supplier_id = options['supplier_id'].to_i
    @category_id = options['category_id'].to_i
    @stock_quantity = options['stock_quantity'].to_i
    @buying_cost = options['buying_cost']
    @selling_price = options['selling_price']
  end

  def save()
    sql = "INSERT INTO products
    (name, description, supplier_id, category_id, stock_quantity, buying_cost, selling_price)
    VALUES ($1, $2, $3, $4, $5, $6, $7) returning id"
    values = [@name, @description, @supplier_id, @category_id, @stock_quantity, @buying_cost, @selling_price]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def update()
    sql = "UPDATE products SET (name, description, supplier_id, category_id)
    = ($1, $2, $3, $4, $5, $6, $7) WHERE id = $8"
    values = [@name, @description, @supplier_id, @category_id, @stock_quantity, @buying_cost, @selling_price, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM products"
    return SqlRunner.run(sql).map{|product| Product.new(product)}
  end

end
