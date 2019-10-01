class Board

    EMPTY = '-'
    
    attr_accessor :board

    def initialize
        @board = newBoard
    end
    
    def newBoard
        #     y0   y1   y2   y3   y4   y5   y6   y7   y8   y9   y10
        x0 = ['', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-']
        x1 = ['', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-']
        x2 = ['', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-']
        x3 = ['', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-']
        x4 = ['', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-']
        x5 = ['', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-']
        x6 = ['', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-']
        x7 = ['', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-']
        x8 = ['', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-']
        x9 = ['', '-', '-', '-', '-', '-', '-', '-', '-', '-', '-']
    
        board = [x0, x1, x2, x3, x4, x5, x6, x7, x8, x9]
    end
    
    def showBoard
        puts
        puts " 1 2 3 4 5 6 7 8 9 0"
        puts "x-------------------x"
        self.board.each { |row| puts row.join(' ') }
        puts "x-------------------x"
        puts
    end

    def dropPiece(y, piece)
        if y == 0
            y = 10
        end
        self.board.reverse_each do |arrX|
            if arrX[y] == EMPTY
                arrX[y] = piece
                break
            end
        end
    end

    def won?
        false
    end

    def gameOver?
        !self.board[0].include?(EMPTY)
    end

end