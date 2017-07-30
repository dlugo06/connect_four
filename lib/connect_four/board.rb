module ConnectFour
  class Board
    attr_reader :current_move, :size, :discs, :grid

    def initialize
      # @ size = [rows, columns]
      @size = [6, 7]
      # @discs is an array of disc objects
      @discs = []
      @grid = create_grid_from_size(size)
    end

    def set_disc(column)
      # game calls play which calls board.play
      @current_move = column
      update
      render
    end

    def connect_four?
      # evaluate if the board has a connect-four state
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
  end
end
