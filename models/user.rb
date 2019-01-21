require_relative("../db/sql_runner.rb")

class User

attr_reader :id
attr_accessor :name, :budget

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @budget = options['budget']
  end

  def save
    sql = "INSERT INTO users (name, budget)
    VALUES ($1, $2)
    RETURNING id"
    values = [@name, @budget]
    result = SqlRunner.run(sql, values)
    @id = result.first['id']
  end

  def self.all
    sql = "SELECT * FROM users"
    result = SqlRunner.run(sql)
    return result.map { |user| User.new(user)}
  end

  def self.find( id )
    sql = "SELECT * FROM users WHERE id = $1"
    values = [id]
    user = SqlRunner.run( sql, values )
    result = User.new( user.first )
    return result
  end

  def self.delete_all
    sql = "DELETE FROM users"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM users WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def purchases()
    sql = "SELECT purchases.*
    FROM purchases
    INNER JOIN users
    ON purchases.user_id = users.id
    WHERE purchases.user_id = $1"
    values = [id]
    data = SqlRunner.run(sql, values)
    return data.map {|spend| Purchase.new(spend)}
  end

  def total_of_purchases(id)
    sql = "SELECT SUM(purchases.amount)
    FROM purchases
    INNER JOIN users
    ON purchases.user_id = users.id
    WHERE purchases.user_id = $1"
    values = [id]
    SqlRunner.run(sql, values)[0]["sum"]
  end

  def update() #
    sql = "UPDATE users SET (name, budget)
    = ($1, $2) WHERE id = $3"
    values = [@name, @budget, @id]
    SqlRunner.run(sql, values)
  end
  # def total_purchase_amount
  #
  # end

end
