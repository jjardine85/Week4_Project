require( 'pg' )

class SqlRunner

  def self.run( sql, values = [] )
    begin
      # db = PG.connect({ dbname: 'spending_app', host: 'localhost' })
      db = PG.connect({
        dbname: 'd77qtqocjvuubt',
        host: 'ec2-107-22-238-186.compute-1.amazonaws.com',
        port: 5432,
        user: 'xfbchbkezkiymn',
        password: 'e28c660e1e59520a3db300e35383cad88baa17727da4433463527cec1a654e31'
        })
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close() if db != nil
    end
    return result
  end

end
