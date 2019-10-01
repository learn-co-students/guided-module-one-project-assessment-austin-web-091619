PERSONAL_STAT = 1
GLOBAL_STAT = 2
MAIN_MENU = 3

def show_stats
    puts "-----Stats Menu-----"
    puts

    puts "1. Personal Statistics"
    puts "2. Global Statistics"
    puts "3. Return to Main Menu"
    input = gets.chomp.to_i
    if input == PERSONAL_STAT
        show_personal_stat
    elsif input == GLOBAL_STAT
        show_global_stat
    elsif input == MAIN_MENU
        gameIntro
    end
end



def show_personal_stat
    puts "Personal Statistics"
    puts "1. Fastest Completion by Level"
    puts "2. Success Rate by Level"
    puts "3. Return to Stats Menu"
    input = gets.chomp.to_i
        if input == 1
                
        end

        if input == 2
            
        end

        if input == 3
            show_stats
        end
end

def show_global_stat
    puts "Global Statistics"
    puts "1. Fastest Completion by Level"
    puts "2. Success Rate by Level"
    puts "3. Return to Stats Menu"   
    input = gets.chomp.to_i
        if input == 1

        end

        if input == 2

        end

        if input == 3
            show_stats
        end
end


show_stats