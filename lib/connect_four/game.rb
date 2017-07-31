module ConnectFour
  class Game
    def initialize
      @board   = Board.new
      @players = []
      @current_player_index = 0
    end

    def launch
      welcome
      play until done?
      summarize
    end

    private

    attr_reader :abort, :board, :players, :current_player_index

    def play
      board.display_grid
      column = current_player.move
      return if move.empty?

      board.set_disc(column)
      assign_next_player
    rescue Interrupt
      @abort = true
    end

    def welcome
      names = []
      puts 'Player 1 please enter your name:'
      names << STDIN.gets.chomp.capitalize
      puts 'Player 2 please enter your name:'
      names << STDIN.gets.chomp.capitalize
      create_players(names)
      puts "[Connect Four] #{@players.map(&:name).join(' vs ')}"
      puts 'Ctrl-C to abort.'
      puts
    end

    def summarize
      # announce if game ends in a tie, otherwise the name of the winner.
      puts
      puts '[Connect Four] game has ended.' unless aborted?
    end

    def current_player
      players[current_player_index]
    end

    def assign_next_player
      # locate the next current player
      @current_player_index = (@current_player_index + 1) % players.count
    end

    def done?
      # check if game play is complete (ie: a player won or the boad is full)
      board.connect_four? || board.full? || aborted?
    end

    def aborted?
      !!abort
    end

    def create_players(names_arr)
      names_arr.each { |name| @players << Player.new(name) }
      @players.each_with_index { |player, i| player.assign_color(i) }
    end
  end
end
