require_relative '../lib/gameIntro.rb'
require_relative '../lib/mainMenu.rb'
require_relative '../lib/statsMenu.rb'
require_relative '../lib/game.rb'

NEW_GAME = 1
CONTINUE_GAME = 2
SHOW_STATS = 3

# GAME INTRO
userExists = gameIntro

if userExists
    user = loginMenu
else
    user = createUser
end

loop do

    # MAIN MENU
    userInput = mainMenu(user)

    # GAME PLAY
    if userInput == NEW_GAME
        newGame(user)
    elsif userInput == CONTINUE_GAME
        continueGame(user)
    elsif userInput == SHOW_STATS
        #STATS MENU
        statsMenu(user)
    end

    break if stopGame?

end

puts "See you soon!"