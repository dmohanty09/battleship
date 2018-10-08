require './lib/board'

# Example script to initialize a board with ships and print the grid.

board = Board.new
board.place_ships!
board.print_grid
