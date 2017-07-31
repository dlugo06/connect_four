module ConnectFour
  class Board
    attr_reader :current_move, :size, :grid

    def initialize
      # @ size = [rows, columns]
      @size = [6, 7]
      # @grid is array or arrays of nil or player objects
      @grid = create_grid_from_size(size)
    end

    def set_disc(column)
      # game calls play which calls board.play
      @current_move = column
      update
      render
    end

    def connect_four?

      false
    end

    def full?
      # evaluate if the board is full
      false
    end

    def display_grid
      system('clear')
      print 'Move (L)eft or (R)ight then (Enter) to select where to drop your disc.'
      print grid_string
      collect_response
    end

    private

    def render
      puts "[board] updated with move: #{current_move}"
      puts
    end

    def update
      # update the board's state based on the player's move
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

    def collect_response
      response = STDIN.gets.chomp.downcase
      unless response == 'l' || response == 'r'
        print "Please select only (L)eft or (R)ight (or Ctrl-C to quit)"
        collect_response
      end
      response
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
