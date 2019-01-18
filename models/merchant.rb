require_relative("../db/sql_runner.rb")

class Merchant

attr_reader :name, :id, :type, :purchase_id

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

end
