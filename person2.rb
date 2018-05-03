require 'pg'

begin
  con = PG.connect :dbname => 'person',
                   :user => 'postgres',
                   :host => 'localhost',
                   :password => '1234qwer'
 rs = con.exec "SELECT * FROM person"
  rs.each do |row|
    puts "%d| %s | %i"  % [ row ['id'],    row ['name'],  row ['age'] ]
  end

end