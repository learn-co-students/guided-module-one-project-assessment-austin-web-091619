
# TO BE CONTINUED
def gameIntro
    
    puts "FLASH INTRO"
    puts
    puts "INTRODUCTION / game explanation"
    puts 
    puts "made by so and so on what date"
    puts
    
    input = ""
    while input != "exit"
        puts "do you have an account? (y,n)"
        input = gets.chomp
        
        if input == "y"
            return true
            break
        elsif input == "n"
            return false
        else
            puts "invalid entry, try again"
            
        end
    end
end

    # TO BE CONTINUED
    def loginMenu
        puts
        print "Enter Username: "
        username = gets.chomp
        
        puts
        print "Enter Password: "
        password = gets.chomp
        
        user = User.find_by(name: name)
        
        while user.password != password
            puts "incorrect, please re-enter password"
            password = gets.chomp
        end
        
        puts "***CORRECT!***"
    end

    # TO BE CONTINUED
    def createUser
        
        puts "New account info"
        puts "Username: "
        new_username = gets.chomp
        
        puts "Password: "
        new_password = gets.chomp
        puts "Re-enter password"
        confirm_new_password = gets.chomp
        
        while confirm_new_password != new_password do
            puts "Passwords don't match"
            puts "re-enter password:"
            confirm_new_password = gets.chomp
        end
        
        User.create(name: new_username, password: new_password)
        
    end