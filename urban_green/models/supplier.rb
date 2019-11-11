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



end
