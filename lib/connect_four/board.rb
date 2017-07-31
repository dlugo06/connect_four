require 'pry'
module ConnectFour
  class Board
    attr_reader :size, :grid

    def initialize
      # @ size = [rows, columns]
      # @grid is array or arrays of nil or player objects
      @size = [6, 7]
      @grid = create_grid_from_size(size)
    end

    def update(player)
      column = player.location
      (size[0] - 1).downto(0) do |row|
        if grid[row][column].nil?
          return grid[row][column] = player
        end
      end
    end

    def connect_four?
      result = false
      (size[0] - 1).downto(0) do |y|
        grid[y].each_with_index do |disc, x|
          starting = check_location(y, x)
          if starting
            player = starting
            vertical = check_location(y - 1, x)
            diagonal_right = check_location(y - 1, x + 1)
            diagonal_left = check_location(y - 1, x - 1)
            horizontal = check_location(y, x + 1)
            if vertical
               vertical_win = vertical_assess([y - 2, x], player)
               return vertical_win if vertical_win
            end
            if horizontal
              horizontal_win = horizontal_assess([y, x + 2], player)
              return horizontal_win if horizontal_win
            end
            if diagonal_right
              diagonal_right_win = diagonal_right_assess([y - 2, x + 2], player)
              return diagonal_right_win if diagonal_right_win
            end
            if diagonal_left
              diagonal_left_win = diagonal_left_assess([y - 2, x - 2], player)
              return diagonal_left_win if diagonal_left_win
            end
          end
        end
      end
      result
    end

    def full?
      grid.each do |row|
        row.each do |location|
          return false if location.nil?
        end
      end
      true
    end

    def display_grid_for(player)
      system('clear')
      puts "#{player.name}'s turn"
      puts 'Move (L)eft or (R)ight then (D)rop to select where to drop your disc.'
      print display_icon_at_location(player)
      puts grid_string
    end

    def full_column?(location)
      !(grid[0][location].nil?)
    end

    private

    def check_location(y, x)
      return nil if (y == size[0] || y < 0) || (x == size[1] || x < 0)
      grid[y][x]
    end

    def diagonal_right_assess(location, player)
      third = check_location(location[0], location[1])
      fourth = check_location(location[0] - 1, location[1] + 1)
      if third == player && fourth == player
        return player
      end
      false
    end

    def diagonal_left_assess(location, player)
      third = check_location(location[0], location[1])
      fourth = check_location(location[0] - 1, location[1] - 1)
      if third == player && fourth == player
        return player
      end
      false
    end

    def vertical_assess(location, player)
      third = check_location(location[0], location[1])
      fourth = check_location(location[0] - 1, location[1])
      if third == player && fourth == player
        return player
      end
      false
    end

    def horizontal_assess(location, player)
      third = check_location(location[0], location[1])
      fourth = check_location(location[0], location[1] + 1)
      if third == player && fourth == player
        return player
      end
      false
    end

    def create_grid_from_size(size_arr)
      rows = size_arr[0]
      columns = size_arr[1]
      Array.new(rows) { Array.new(columns) }
    end

    def display_disc(y,x)
      disc = @grid[y][x]
      disc.nil? ? ' ' : icons[disc.color.to_sym]
    end

    def display_icon_at_location(player)
      output = ' ' * 7
      spaces = player.location
      icon = icons[player.color.to_sym]
      output + ('   ' * spaces) + icon
    end

    def icons
      { blue: '🔹', gold: '🔸' }
    end

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
