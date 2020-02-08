require('pg')

class SqlRunner

  def self.run(sql, values = [])
    begin
      db = PG.connect({dbname: 'df1ujgehc75tdd', 
      host: 'ec2-184-72-235-80.compute-1.amazonaws.com',
      port: '5432', user: 'akkhfscqfmcyut', password: 'b07172dc901e15daaa20422f0d8a1453d3c40daf4729458598c227a10d563358'})
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
      db.close() if db != nil
    end
    return result
  end

end
