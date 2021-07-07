require_relative 'board.rb'

USER_PIECE = 'O'
FILLIN_PIECE = 'x'
TIME_LIMIT = 30

def newGame(user)
    level = 1
    playGame(user, level)
end

def continueGame(user)
    level = user.last_level
    playGame(user, level)
end

def playGame(user, level)

    win = false
    gameOver = false
    timeOver = false
    board = Board.new
    starting_time = Time.now
    
    puts
    puts "    L E V E L #{level}"
    puts
    
    while !(win or gameOver or timeOver)
        puts "Remaining Time: #{(TIME_LIMIT - (Time.now - starting_time)).to_i}s"
        
        if timeOver
            break
        end
        
        print "Press you play key: "
        userInput = gets.chomp.to_i
        board.dropPiece(userInput, USER_PIECE)
        
        board.showBoard
        
        level.times {
        board.dropPiece(rand(1..10), FILLIN_PIECE) }
        
        win = board.won?
        gameOver = board.gameOver?
        timeOver = TIME_LIMIT < (Time.now - starting_time)
    end
    
    # POST GAME
    if win
        puts "        WIN"
        puts
        puts "  SUCCESFULLY DONE!"
        
        completion_time = Time.now - starting_time
        user.save(completion_time, level)
    elsif gameOver
        puts "      GAME OVER"
        puts
        puts " BOARD IS FILLED UP!"
        
        user.save(nil, level)
    elsif timeOver
        puts "      GAME OVER"
        puts
        puts "     TIME IS UP!"
        
        user.save(nil, level)
    end
    
end

def stopGame?
    while true
        puts
        puts "Would you like to continue? (y/n)"
        userInput = gets.chomp

        if userInput == 'y'
            return false
        elsif userInput == 'n'
            return true
        else
            puts "Wrong input"
            puts
        end
    end
end