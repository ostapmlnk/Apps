require 'pg'

begin
  con = PG.connect :dbname => 'postgres',
                   :host => 'localhost',
                   :user => 'postgres',
                   :password => '1234qwer'

  rs = con.exec "Select * From person"
  rs.each do |row|
    puts "|%-1i | %-6s | %-7s | %i |"% [ row['id'], row['name'], row['last_name'], row['room'] ]
  end
 puts "print you Id: "
 id = gets.chomp
 puts "print you Name: "
  name = gets.chomp.capitalize
  puts "print you Last Name: "
  last_name = gets.chomp.capitalize
 puts "print you Room: "
 room = gets.chomp
  con.exec("INSERT INTO person (id, name, last_name, room) VALUES ('#{id}','#{name}', '#{last_name}', '#{room}');")

    print "\nColums: #{rs.fields}"
    print "\nChoose colums: "
    colums = gets.chomp
    print "Choose what to delete: "
    text = gets .chomp
    con.exec("DELETE FROM person WHERE #{colums} = '#{text}'")



rescue PG::Error => e

  puts e.message

ensure

  rs.clear if rs
  con.close if con

end