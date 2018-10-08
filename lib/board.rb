class Board

	attr_accessor :grid

	def initialize
		@grid = Array.new(10){Array.new(10)}
	end

	def place_ships!
		[
			['T', 2],
			['D', 3],
			['S', 3],
			['B', 4],
			['C', 5]
		].each do |ship|
			place_ship(ship[0], ship[1])
		end
	end

	def place_ship(symbol, length)
		positioned = false
		while positioned == false
			if Random.rand(2) == 0
				positioned = place_horizontal(symbol, length)
			else
				positioned = place_vertical(symbol, length)
			end
		end
	end

	def place_horizontal(symbol, length)
		x = Random.rand(10 - length)
		y = Random.rand(10)
		coords = []
		(0..length-1).each do |offset|
			x_offset = x + offset
			if !@grid[x_offset][y].nil?
				return false
			else
				coords << [x_offset, y]
			end
		end
		coords.each do |c|
			@grid[c[0]][c[1]] = symbol
		end
		return true
	end

	def place_vertical(symbol, length)
		x = Random.rand(10)
		y = Random.rand(10 - length)
		coords = []
		(0..length-1).each do |offset|
			y_offset = y + offset
			if !@grid[x][y_offset].nil?
				return false
			else
				coords << [x, y_offset]
			end
		end
		coords.each do |c|
			@grid[c[0]][c[1]] = symbol
		end
		return true
	end

	def print_grid
		str = ""
		@grid.each do |row|
			str << row.map do |column|
				symbol = '.'
				if !column.nil?
					symbol = column
				end
				symbol
			end.join(' ') + "\n"
		end
		puts str
	end
end
