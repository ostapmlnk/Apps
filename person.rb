require 'pg'

begin
  con = PG.connect :dbname => 'person',
                   :user => 'postgres',
                   :host => 'localhost',
                   :password => '1234qwer'
con.exec "CREATE TABLE Person( Id INTEGER PRIMARY KEY,
                            Name VARCHAR(20), Age INT)"
  con.exec "INSERT INTO Person VALUES(1,'Vadum',21)"
  con.exec "INSERT INTO Person VALUES(2,'Bogdan',18)"
  con.exec "INSERT INTO Person VALUES(3,'Ostap',18)"
  con.exec "INSERT INTO Person VALUES(4,'Max',21)"

rescue PG::Error => e

  puts e.message

ensure

  con.close if con

end