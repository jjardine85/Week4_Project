require_relative("../db/sql_runner.rb")

class Merchant

attr_reader :id, :purchase_id
attr_accessor :name, :type

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @type = options['type']
    @purchase_id = options['purchase_id'].to_i
  end

  def save
    sql = "INSERT INTO merchants(name, type, purchase_id)
    VALUES ($1, $2, $3)
    RETURNING id"
    values = [@name, @type, @purchase_id]
    result = SqlRunner.run(sql, values)
    @id = result.first['id']
  end

  def self.all
    sql = "SELECT * FROM merchants"
    result = SqlRunner.run(sql)
    return result.map { |merchant| Merchant.new(merchant)}
  end

  def self.delete_all
    sql = "DELETE FROM merchants"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM merchants WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def read
    sql = "SELECT * FROM merchants WHERE id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map {|merchant| Merchant.new(merchant)}
  end

  def update() #
   sql = "UPDATE merchants SET (name, type)
   = ($1, $2) WHERE id = $3"
   values = [@name, @type, @id]
   SqlRunner.run(sql, values)
 end

end
