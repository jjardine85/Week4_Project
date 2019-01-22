require_relative('../db/sql_runner')
require('pry')
require('date')

class Purchase

attr_reader :user_id
attr_accessor :id, :amount, :merchant, :merchant_id, :date_picked, :type, :merchant_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @amount = options['amount'].to_i
    @merchant = options['merchant']
    @merchant_id = options['merchant_id']
    @date_picked = options['date_picked']
    @type = options['type']
    @user_id = options['user_id'].to_i
  end

  # current_time = Time.now.strftime("%H:%M")
  # current_date = DateTime.now.strftime("%d/%m/%Y")

  def save
    sql = "INSERT INTO purchases(amount, merchant, merchant_id, date_picked,
    type, user_id)
    VALUES ($1, $2, $3, $4, $5, $6)
    RETURNING id"
    values = [@amount, @merchant, @merchant_id, @date_picked, @type, @user_id]
    result = SqlRunner.run(sql, values)
    @id = result.first['id'].to_i
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

  def self.find(id)
    sql = "SELECT * FROM purchases WHERE id = $1"
    values = [id]
    purchase = SqlRunner.run(sql, values)
    result = Purchase.new(purchase.first)
    return result
  end

  def update() #
    sql = "UPDATE purchases SET (amount, merchant, merchant_id date_picked, type)
    = ($1, $2, $3, $4) WHERE id = $5"
    values = [@amount, @merchant, @merchant_id, @date_picked, @type, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM purchases WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def purchase_date
    sql = "SELECT date_picked FROM purchases WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def merchant
    sql = "SELECT merchants.name
    FROM purchases
    INNER JOIN users
    ON purchases.user_id = users.id
    INNER JOIN merchants
    ON merchants.id = purchases.merchant_id
     WHERE purchases.id = $1"
     values = [@id]
     SqlRunner.run(sql, values)
  end

end
