
# TO BE CONTINUED
def gameIntro

    puts "FLASH INTRO"
    puts
    puts "INTRODUCTION / game explanation"
    puts 
    puts "made by so and so on what date"
    puts

    input = nil
    loop do
        puts "do you have an account? (y/n)"
        input = gets.chomp

        if input == 'y'
            true
            break
        elsif input == 'n'
            false
            break
        else
            puts "Invalid entry, try again"
            puts
        end
    end
end

    # VINCENT
    def loginMenu

    end
    
    # TO BE CONTINUED
    def createUser
        
            puts
            puts "NEW ACCOUNT INFO"
            puts
            print "Username: "
            username = gets.chomp
        
        loop do
            
            puts
            print "Password: "
            password = gets.chomp
            
            puts
            print "Re-enter password"
            confirm_password = gets.chomp
            
            break if confirm_password == password
            
        end
        
        User.create(name: username, password: password)
        
    end