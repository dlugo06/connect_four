module ConnectFour
  class Game
    attr_reader :abort, :board, :players, :current_player_index, :winner

    def initialize
      @board   = Board.new
      @players = []
      @current_player_index = 0
      @winner = false # winner will either be false or a player instance
      @abort = false
    end

    # initiates game loop
    def launch
      player_names = Displayable::gather_names
      ready_players(player_names)
      play until done?
      Displayable::summarize(self)
    end

    # check if user has attempted to exit
    def aborted?
      @abort
    end

    private

    # defines a play made by a player. Continues until game is over.
    def play
      Displayable::ui_loop(current_player, @board)
      @board.update(current_player)
      current_player.reset_location
      assign_next_player
    rescue Interrupt
      @abort = true
    end

    # return current player
    def current_player
      @players[current_player_index]
    end

    # locate the next current player
    def assign_next_player
      @current_player_index = (@current_player_index + 1) % @players.count
    end

    # check if game play is complete (ie: a player won or the boad is full)
    def done?
      @winner = board.connect_four?
      @winner || board.full? || aborted?
    end

    # populate players array with player instances
    def ready_players(names_arr)
      names_arr.each { |name| @players << Player.new(name) }
      @players.each_with_index { |player, i| player.assign_color(i) }
    end
  end
end
