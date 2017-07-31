module ConnectFour
  class Board
    attr_reader :current_move, :size, :discs, :grid

    def initialize
      # @ size = [rows, columns]
      @size = [6, 7]
      # @discs is an array of disc objects
      @discs = []
      # @grid is array or arrays of nil or disc objects
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

    private

    def render
      puts "[board] updated with move: #{current_move}"
      puts
    end

    def update
      # update the board's state based on the player's moee
    end

    def create_grid_from_size(size_arr)
      rows = size_arr[0]
      columns = size_arr[1]
      Array.new(rows) { Array.new(columns) }
    end

    def display_grid
      string =
      %(
      |#{display_disc(0,0)} |#{display_disc(0,1)} |#{display_disc(0,2)} |#{display_disc(0,3)} |#{display_disc(0,4)} |#{display_disc(0,5)} |#{display_disc(0,6)} |
      |#{display_disc(1,0)} |#{display_disc(1,1)} |#{display_disc(1,2)} |#{display_disc(1,3)} |#{display_disc(1,4)} |#{display_disc(1,5)} |#{display_disc(1,6)} |
      |#{display_disc(2,0)} |#{display_disc(2,1)} |#{display_disc(2,2)} |#{display_disc(2,3)} |#{display_disc(2,4)} |#{display_disc(2,5)} |#{display_disc(2,6)} |
      |#{display_disc(3,0)} |#{display_disc(3,1)} |#{display_disc(3,2)} |#{display_disc(3,3)} |#{display_disc(3,4)} |#{display_disc(3,5)} |#{display_disc(3,6)} |
      |#{display_disc(4,0)} |#{display_disc(4,1)} |#{display_disc(4,2)} |#{display_disc(4,3)} |#{display_disc(4,4)} |#{display_disc(4,5)} |#{display_disc(4,6)} |
      |#{display_disc(5,0)} |#{display_disc(5,1)} |#{display_disc(5,2)} |#{display_disc(5,3)} |#{display_disc(5,4)} |#{display_disc(5,5)} |#{display_disc(5,6)} |
      )
      system('clear')
      print string
      collect_response
    end

    def display_disc(y,x)
      disc_at_xy = @grid[y][x]
      disc_at_xy.nil? ? '   ' : disc_at_xy.player.icon
    end

    def collect_response
      response = STDIN.gets.chomp
      puts response
    end
  end
end
