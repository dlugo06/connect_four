module ConnectFour
  class Game
    def initialize
      @board   = Board.new
      @players = []
      @current_player_index = 0
      @winner = false # winner will either be false or a player instance
    end

    # initiates game loop
    def launch
      welcome
      play until done?
      summarize
    end

    private

    attr_reader :abort, :board, :players, :current_player_index, :winner

    # defines a play made by a player. Continues until game is over.
    def play
      ui_loop
      @board.update(current_player)
      current_player.reset_location
      assign_next_player
    rescue Interrupt
      @abort = true
    end

    # loop that calls grid as well as current player location. continues on submit ('d')
    def ui_loop(notice = nil)
      current_player.sanitize_location(@board.size[0])
      @board.display_grid_for(current_player)
      puts notice if notice
      response = current_player.move
      column_full = @board.full_column?(current_player.location)
      invalid_column = column_full && !response.empty? && response == 'd'
      notice = invalid_column ? 'That column is full, try another.' : nil
      ui_loop(notice) unless response == 'd' && !(column_full)
    end

    # request names of players
    # TODO: Allow for more than two players
    def welcome
      names = []
      puts 'Player 1 please enter your name:'
      names << STDIN.gets.chomp.capitalize
      puts 'Player 2 please enter your name:'
      names << STDIN.gets.chomp.capitalize
      create_players(names)
    end

    # explain the results after game has ended
    def summarize
      full = @board.full?
      puts
      puts "Congratuations! #{@winner.name} has won!" if @winner
      puts "The board is full, the game is a tie." if full
      puts '[Connect Four] game has ended.' unless aborted?
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

    # check if user has attempted to exit
    def aborted?
      @abort
    end

    # populate players array with player instances
    def create_players(names_arr)
      names_arr.each { |name| @players << Player.new(name) }
      @players.each_with_index { |player, i| player.assign_color(i) }
    end
  end
end
