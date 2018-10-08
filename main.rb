require './lib/board'

board = Board.new
board.place_ships!
board.print_grid
