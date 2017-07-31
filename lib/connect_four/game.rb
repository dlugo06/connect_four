require 'pry'
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
      ui_loop
      board.update(current_player)
      current_player.reset_location
      assign_next_player
    rescue Interrupt
      @abort = true
    end

    def ui_loop(notice = nil)
      current_player.sanitize_location(board.size[0])
      board.display_grid_for(current_player)
      puts notice if notice
      response = current_player.move
      column_full = board.full_column?(current_player.location)
      invalid_column = column_full && !response.empty? && response == 'd'
      notice = invalid_column ? 'That column is full, try another.' : nil
      ui_loop(notice) unless response == 'd' && !(column_full)
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
      winner = board.connect_four?
      full = board.full?

      # announce if game ends in a tie, otherwise the name of the winner.
      puts
      puts "Congratuations! #{winner.name} has won!" if winner
      puts "The board is full, the game is a tie." if full
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
