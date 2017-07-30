module ConnectFour
  class Board
    attr_reader :move, :size, :grid

    def initialize
      @size = [6, 7]
    end

    def play(move)
      @move = move
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
      puts "[board] updated with move: #{move}"
      puts
    end

    def update
      # update the board's state based on the player's moee
    end
  end
end
