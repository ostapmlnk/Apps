require 'pg'
begin
  con = PG.connect :dbname => 'postgres',
                   :host => 'localhost',
                   :user => 'postgres',
                   :password => '1234qwer'
   rs = con.exec "Create table Computers  (Id INTEGER PRIMARY KEY,
                                                  Name VARCHAR(20),
                                                Price VARCHAR (20))"
  con.exec "Insert into Computers (ID,'Name','Price')"

rescue PG::Error => e

  puts e.message

ensure

  con.close if con

end