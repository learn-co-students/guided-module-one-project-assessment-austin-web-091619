class User < ActiveRecord::Base
    has_many :stats
    has_many :levels, through: :stats
end

def self.check
    
    puts
    print "Enter Username: "
    username = gets.chomp

    puts
    print "Enter Password: "
    password = gets.chomp

    user = self.find_by(name: name)

    while user.password != password
        puts "incorrect, please re-enter password"
        password = gets.chomp
    end

    puts "***CORRECT!***"

end
