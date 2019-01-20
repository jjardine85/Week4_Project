require_relative('../db/sql_runner')
require('date')

class Purchase

attr_reader :user_id, :merchant_id
attr_accessor :id, :amount, :merchant, :date_picked, :time_picked, :type

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @amount = options['amount'].to_i
    @merchant = options['merchant']
    @merchant_id = options['merchant_id']
    @date_picked = options['date']
    @time_picked = options['time']
    @type = options['type']
    @user_id = options['user_id'].to_i
  end

  # current_time = Time.now.strftime("%H:%M")
  # current_date = DateTime.now.strftime("%d/%m/%Y")

  def save
    sql = "INSERT INTO purchases(amount, merchant, merchant_id, date_picked, time_picked,
    type, user_id)
    VALUES ($1, $2, $3, $4, $5, $6, $7)
    RETURNING id"
    values = [@amount, @merchant, @merchant_id, @date_picked, @time_picked, @type, @user_id]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def self.all
    sql = "SELECT * FROM purchases"
    result = SqlRunner.run(sql)
    return result.map { |purchase| Purchase.new(purchase)}
  end

  def self.delete_all
    sql = "DELETE FROM purchases"
    SqlRunner.run(sql)
  end

  def self.read
    sql = "SELECT * FROM purchases WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return result.map {|purchase| Purchase.new(purchase)}
  end

  def update() #
    sql = "UPDATE purchases SET (amount, merchant, date_picked, time_picked, type)
    = ($1, $2, $3, $4, $5) WHERE id = $6"
    values = [@amount, @merchant, @date_picked, @time_picked, @type, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM purchases WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end



end
