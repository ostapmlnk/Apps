require 'pg'

begin
  con = PG.connect :dbname => 'postgres',
                   :host =>'localhost',
                   :user =>'postgres',
                   :password =>'1234qwer'
                   con.exec "Create table Streets
                                                 (Id INTEGER PRIMARY KEY,
                                                  Name VARCHAR(20),
                                                  Last_Name VARCHAR(20),
                                                  Room INT)"

  con.exec "INSERT INTO Streets VALUES(ID,'NAME','LAST NAME',ROOM)"

rescue PG::Error => e
  puts e.message
ensure
  con.close if con
end