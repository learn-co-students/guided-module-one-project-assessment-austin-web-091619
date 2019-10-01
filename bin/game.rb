require_relative 'user.rb'
require_relative 'board'

USER_PIECE = 'O'
FILLIN_PIECE = 'x'
TIME_LIMIT = 30

class Game

    attr_reader :user, :board
    attr_accessor :starting_time

    def initialize(user, board)
        @user = user
        @board = board
        @starting_time = 30
    end

    def playGame(level)
        win = false
        gameOver = false
        timeOver = false

        starting_time = Time.now

        while !(win or gameOver or timeOver)
            puts "Remaining Time: #{(TIME_LIMIT - (Time.now - starting_time)).to_i}sec"

            if timeOver
                break
            end

            print "Press you play key: "
            userInput = gets.chomp
            self.board.dropPiece(userInput.to_i, USER_PIECE)

            self.board.showBoard

            level.times {
                self.board.dropPiece(rand(1..10), FILLIN_PIECE) }

            win = self.board.won?
            gameOver = self.board.gameOver?
            timeOver = TIME_LIMIT < (Time.now - starting_time)
        end

        if win
            puts "        WIN"
            puts
            puts "  SUCCESFULLY DONE!"

            completion_time = Time.now - starting_time

            # Save the completion data to STATS

        elsif gameOver
            puts "      GAME OVER"
            puts
            puts " BOARD IS FILLED UP!"
            puts
        elsif timeOver
            puts "      GAME OVER"
            puts
            puts "     TIME IS UP!"
            puts
        end

    end

    

end