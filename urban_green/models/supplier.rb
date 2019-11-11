require_relative("../db/sql_runner.rb")

class Supplier

  attr_reader :id
  attr_accessor :name, :contact_name, :email, :phone_number

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @contact_name = options['contact_name']
    @email = options['email']
    @phone_number = options['phone_number']
  end

  def save()
    sql = "INSERT INTO suppliers
    (name, contact_name, email, phone_number)
    VALUES ($1, $2, $3, $4)
    RETURNING id;"
    values = [@name, @contact_name, @email, @phone_number]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def update()
    sql = "UPDATE suppliers SET (name, contact_name, email, phone_number) =
    ($1, $2, $3, $4) WHERE id = $5"
    values = [@name, @contact_name, @email, @phone_number, @id]
    SqlRunner.run(sql,values)
  end

  def self.all()
    sql = "SELECT * FROM suppliers"
    return SqlRunner.run(sql).map{|supplier| Supplier.new(supplier)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM suppliers WHERE id = $1"
    values = [id]
    SqlRunner.run(sql,values).map{|supplier| Supplier.new(supplier)}
  end

  def self.delete(id)
    sql = "DELETE FROM suppliers WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

end
