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

    # returns a player instance if a win is achieved, false otherwise
    # TODO: clean this method up. difficult to read
    def connect_four?
      result = false
      (size[0] - 1).downto(0) do |y|
        grid[y].each_with_index do |disc, x|
          starting = check_location(y, x)
          if starting
            player = starting
            vertical_win = vertical_assess([y - 1, x], player)
            return vertical_win if vertical_win
            horizontal_win = horizontal_assess([y, x + 1], player)
            return horizontal_win if horizontal_win
            diagonal_right_win = diagonal_right_assess([y - 1, x + 1], player)
            return diagonal_right_win if diagonal_right_win
            diagonal_left_win = diagonal_left_assess([y - 1, x - 1], player)
            return diagonal_left_win if diagonal_left_win
          end
        end
      end
      result
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

    # clears screen and displays updated grid + current player location
    def display_grid_for(player)
      system('clear')
      puts "#{player.name}'s turn"
      puts 'Move (L)eft or (R)ight then (D)rop to select where to drop your disc.'
      print display_icon_at_location(player)
      puts grid_string
    end

    # checks if a column is full (used to notify player and prevent update)
    def full_column?(location)
      !(grid[0][location].nil?)
    end

    private

    # basic helper of the connect_four? method. accounts for out of bounds
    # returns instance of player if found, nil otherwise
    def check_location(y, x)
      return nil if (y == size[0] || y < 0) || (x == size[1] || x < 0)
      grid[y][x]
    end

    # the following 4 methods are massively not DRY
    # TODO: refactor these 4 methods!
    # checks second third and fourth locations of potential connect four.
    # checks a rising diagonal
    def diagonal_right_assess(location, player)
      second = check_location(location[0], location[1])
      third = check_location(location[0] - 1, location[1] + 1)
      fourth = check_location(location[0] - 2, location[1] + 2)
      if (second == player) && (third == player) && (fourth == player)
        return player
      end
      false
    end

    # checks second third and fourth locations of potential connect four.
    # checks a dropping diagonal
    def diagonal_left_assess(location, player)
      second = check_location(location[0], location[1])
      third = check_location(location[0] - 1, location[1] - 1)
      fourth = check_location(location[0] - 2, location[1] - 2)
      if (second == player) && (third == player) && (fourth == player)
        return player
      end
      false
    end

    # checks second third and fourth locations of potential connect four.
    # checks vertical axis
    def vertical_assess(location, player)
      second = check_location(location[0], location[1])
      third = check_location(location[0] - 1, location[1])
      fourth = check_location(location[0] - 2, location[1])
      if (second == player) && (third == player) && (fourth == player)
        return player
      end
      false
    end

    # checks second third and fourth locations of potential connect four.
    # checks horizontal axis
    def horizontal_assess(location, player)
      second = check_location(location[0], location[1])
      third = check_location(location[0], location[1] + 1)
      fourth = check_location(location[0], location[1] + 2)
      if (second == player) && (third == player) && (fourth == player)
        return player
      end
      false
    end

    # creates a nil-filled array of arrays based on the inputted size
    def create_grid_from_size(size_arr)
      rows = size_arr[0]
      columns = size_arr[1]
      Array.new(rows) { Array.new(columns) }
    end

    # used to display a 'disc' based on location and contents (nil or player)
    def display_disc(y, x)
      disc = @grid[y][x]
      disc.nil? ? ' ' : icons[disc.color.to_sym]
    end

    # used to properly align the current player location w/ game board
    def display_icon_at_location(player)
      output = ' ' * 7
      spaces = player.location
      icon = icons[player.color.to_sym]
      output + ('   ' * spaces) + icon
    end

    # icon legend
    def icons
      { blue: '🔹', gold: '🔸' }
    end

    # generates the grid that is displayed, filling it with current board
    # TODO: refactor this!
    def grid_string
      %(
      |#{display_disc(0,0)} |#{display_disc(0,1)} |#{display_disc(0,2)} |#{display_disc(0,3)} |#{display_disc(0,4)} |#{display_disc(0,5)} |#{display_disc(0,6)} |
      |#{display_disc(1,0)} |#{display_disc(1,1)} |#{display_disc(1,2)} |#{display_disc(1,3)} |#{display_disc(1,4)} |#{display_disc(1,5)} |#{display_disc(1,6)} |
      |#{display_disc(2,0)} |#{display_disc(2,1)} |#{display_disc(2,2)} |#{display_disc(2,3)} |#{display_disc(2,4)} |#{display_disc(2,5)} |#{display_disc(2,6)} |
      |#{display_disc(3,0)} |#{display_disc(3,1)} |#{display_disc(3,2)} |#{display_disc(3,3)} |#{display_disc(3,4)} |#{display_disc(3,5)} |#{display_disc(3,6)} |
      |#{display_disc(4,0)} |#{display_disc(4,1)} |#{display_disc(4,2)} |#{display_disc(4,3)} |#{display_disc(4,4)} |#{display_disc(4,5)} |#{display_disc(4,6)} |
      |#{display_disc(5,0)} |#{display_disc(5,1)} |#{display_disc(5,2)} |#{display_disc(5,3)} |#{display_disc(5,4)} |#{display_disc(5,5)} |#{display_disc(5,6)} |
      )
    end
  end
end
