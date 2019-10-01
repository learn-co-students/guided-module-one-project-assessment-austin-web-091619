require_relative 'board'
require_relative 'game'


board = Board.new

# board.showBoard(3)

# board.dropPiece(3, USER_PIECE)
# board.dropPiece(3, FILLIN_PIECE)
# board.dropPiece(3, USER_PIECE)
# board.dropPiece(3, USER_PIECE)


game = Game.new(1,board)
game.playGame(10)