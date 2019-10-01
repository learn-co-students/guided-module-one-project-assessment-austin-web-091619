require_relative 'user.rb'
require_relative 'board'

USER_PIECE = 'O'
FILLIN_PIECE = 'x'

class Game

    attr_reader :user, :board

    def initialize(user, board)
        @user = user
        @board = board
    end

    def playGame(level)
        win = false
        gameOver = false

        while !(win or gameOver)
            print "Press you play key: "
            userInput = gets.chomp
            self.board.dropPiece(userInput.to_i, USER_PIECE)

            self.board.showBoard

            level.times {
                self.board.dropPiece(rand(1..10), FILLIN_PIECE) }

            win = self.board.won?
            gameOver = self.board.gameOver?
        end

        if win
            puts "WIN"
        elsif gameOver
            puts "      GAME OVER"
            puts
            puts " BOARD IS FILLED UP!"
            puts
        end
    end

    

end