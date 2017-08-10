module ConnectFour
  class Board
    attr_reader :size, :grid

    # @size = [rows, columns]
    # @grid is array or arrays of nil or player objects
    def initialize
      @size = [6, 7]
      @grid = create_grid_from_size(size)
    end

    # updates the grid based on player move
    def update(player)
      column = player.location
      (size[0] - 1).downto(0) do |row|
        if grid[row][column].nil?
          return grid[row][column] = player
        end
      end
    end

    # checks if all locations in grid are filled with player instances
    def full?
      grid.each do |row|
        row.each do |location|
          return false if location.nil?
        end
      end
      true
    end

    # checks if a column is full (used to notify player and prevent update)
    def full_column?(location)
      !(grid[0][location].nil?)
    end

    private

    # creates a nil-filled array of arrays based on the inputted size
    def create_grid_from_size(size_arr)
      rows = size_arr[0]
      columns = size_arr[1]
      Array.new(rows) { Array.new(columns) }
    end
  end
end
