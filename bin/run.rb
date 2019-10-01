require_relative '../config/environment'
require_relative '../apps/models/user'

NEW_GAME = 1
CONTINUE_GAME = 2
SHOW_STATS = 3
GAME_OVER = false

while (GAME_OVER)

    gameIntro
    
    choice = gets.chomp

    if choice = NEW_GAME
        GAME_OVER = play_new_game
    elsif choice = CONTINUE_GAME
        GAME_OVER = continue_game
    elsif choice = SHOW_STATS
        GAME_OVER = show_stats
    else
        "Wrong"
    end

    save

end

def play_new_game

end

def continue_game

end

def show_stats

end








# puts "Welcome to _________"
# puts "Do you have an existing account?"
# puts "y/n"
# input = gets.chomp







# def gameIntro
#     if input = 'y'||'Y'
#         "Type your username: "
#         username = gets.chomp
#         "Type your password: "
#         password = gets.chomp

#         User.check(username, password)
#     elsif input = 'n'||'N'
#         "New account info"
#         "Username: "
#         new_username = gets.chomp
#         "Password: "
#         confirm_new_password = gets.chomp
#         "Re-enter Password: "
#         confirm_new_password_2 = gets.chomp
#         if confirm_new_password != confirm_new_password_2
#             puts "Passwords don't match"
#     else
#         "That wasn't y/n"
#     end
# end
