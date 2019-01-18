require_relative("../db/sql_runner.rb")

class User

attr_reader :name, :id, :budget

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

end
