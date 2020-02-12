require('pg')

class SqlRunner

  def self.run(sql, values = [])
    begin
      db = PG.connect({dbname: 'deh47k169dungc', 
      host: 'ec2-3-231-46-238.compute-1.amazonaws.com',
      port: '5432', user: 'svrkbunypnzzkm', password: '54f58764d06cfb7bab6bfc7bf4ec9d4c6eb03f4941ddfb5bb8778a91652202a9'})
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
      db.close() if db != nil
    end
    return result
  end

end
