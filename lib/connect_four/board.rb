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

      false
    end

    def full?
      # evaluate if the board is full
      false
    end

    def display_grid_for(player)
      system('clear')
      puts "#{player.name}'s turn"
      puts 'Move (L)eft or (R)ight then (D)rop to select where to drop your disc.'
      print display_icon_at_location(player)
      puts grid_string
    end

    private



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
