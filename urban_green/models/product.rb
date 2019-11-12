require_relative("../db/sql_runner.rb")

class Product

  attr_reader :id
  attr_accessor :name, :description, :category_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @description = options['description']
    @category_id = options['category_id'].to_i
  end

  def save()
    sql = "INSERT INTO products
    (name, description, category_id)
    VALUES ($1, $2, $3) returning id"
    values = [@name, @description, @category_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def update()
    sql = "UPDATE products SET (name, description, category_id)
    = ($1, $2, $3) WHERE id = $4"
    values = [@name, @description, @category_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM products WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def category_name()
    sql = "SELECT * FROM categories WHERE id = $1"
    values = [@category_id]
    return Category.new(SqlRunner.run(sql, values)[0])
  end

  def self.all()
    sql = "SELECT * FROM products"
    return SqlRunner.run(sql).map{|product| Product.new(product)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM products WHERE id = $1"
    values = [id]
    return Product.new(SqlRunner.run(sql, values)[0])
  end

end
