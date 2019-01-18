require_relative('../db/sql_runner')
require('date')

class Purchase

attr_reader :amount, :merchant, :date, :time, :type, :user_id
attr_accessor :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @amount = options['amount'].to_i
    @merchant = options['merchant']
    @date = options['date'].to_i
    @time = options['time'].to_i
    @type = options['type']
    @user_id = options['user_id'].to_i
  end

  # current_time = Time.now.strftime("%H:%M")
  # current_date = DateTime.now.strftime("%d/%m/%Y")

  def save
    sql = "INSERT INTO purchases(amount, merchant, date, time, type, user_id)
    VALUES ($1, $2, $3, $4, $5, $6)
    RETURNING id"
    values = [@amount, @merchant, @date, @time, @type, @user_id]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end


end
