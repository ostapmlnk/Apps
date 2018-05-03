require 'pg'
begin
  $con = PG.connect :dbname => 'postgres',
                    :host => 'localhost',
                    :user => 'postgres',
                    :password => '1234qwer'

  class Pes
    def self.method1
      rs = $con.exec "Select * from Computers"
      rs.each do |row|
        puts "|%-4i | %-10s| %-1i$ |"% [ row['id'], row['name'], row['price'] ]
      end
      puts "print you Id Comuter: "
      id = gets.chomp
      puts "print you Name Computer: "
      name = gets.chomp.capitalize
      puts "print Price: "
      price = gets.chomp.capitalize
      $con.exec("INSERT INTO Computers (id, name, price) VALUES ('#{id}','#{name}', '#{price}');")
    end
    def self.method2
      print "What computer you want? ID: "
      id = gets.chomp
      rs = $con.exec "Select * from Computers Where ID=#{id}"
      rs.each do |row|
        puts "|%-1i | %-6s| %i$ |"% [ row['id'], row['name'], row['price'] ]
      end
    end
  end

  person = Pes
  print "If you want choise comuter with database print 1 or if you want add you computer print 2:"
  x = gets.chomp.to_i
  if x == 1
    person.method1
  elsif x == 2
    person.method2
  else
    puts "error"
  end

rescue PG::Error => e
  puts e.message
ensure
  @con.close if @con
end