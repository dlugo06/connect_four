module ConnectFour
  module Displayable
    # request names of players
    # TODO: Allow for more than two players
    def self.gather_names
      system('clear')
      names = []
      puts 'Player 1 please enter your name:'
      names << STDIN.gets.chomp.capitalize
      puts 'Player 2 please enter your name:'
      names << STDIN.gets.chomp.capitalize
    end

    # explain the results after game has ended
    def self.summarize(game)
      puts
      if game.winner
        puts "Congratuations! #{game.winner.name} has won!"
      elsif game.board.full?
        puts "The board is full, the game is a tie."
      end
      puts goodbye(game)
    end

    # loop that calls grid as well as current player location.
    def self.ui_loop(player, board, notice = nil)
      player.sanitize_location(board.size[0])
      display_grid_for(player, board)
      puts notice if notice
      move = collect_move(player)
      player.update_location(move)
      raise Interrupt if move == 'q'
      column_full = board.full_column?(player.location)
      invalid_column = column_full && !move.empty? && move == "\e[B"
      notice = invalid_column ? 'That column is full, try another.' : nil
      ui_loop(player, board, notice) unless move == "\e[B" && !(column_full)
    end

    private

    # clears screen and displays updated grid + current player location
    def self.display_grid_for(player, board)
      system('clear')
      puts "#{player.name}'s turn"
      puts 'Use ⟸  and ⟹  to move left and right. ⬇︎  to select where to drop your disc. (q) to Quit.'
      print display_icon_at_location(player)
      puts display_grid(board.size, board.grid)
    end

    def self.collect_move(player)
      print "[#{player.name}]: "
      STDIN.echo = false
      STDIN.raw!
      result = STDIN.getch.chomp.downcase
      result << STDIN.read_nonblock(2) rescue nil if result == "\e"
    ensure
      STDIN.echo = true
      STDIN.cooked!
      return result
    end

    # generates the grid that is displayed, filling it with current board
    def self.display_grid(size, grid)
      str = "\n"
      (size[0]).times do |y|
        (size[1]).times do |x|
          str += %(|#{display_disc(y, x, grid)} )
        end
        str += "|\n"
      end
      str
    end

    # used to display a 'disc' based on location and contents (nil or player)
    def self.display_disc(y, x, grid)
      disc = grid[y][x]
      disc.nil? ? ' ' : icons[disc.color.to_sym]
    end

    # used to properly align the current player location w/ game board
    def self.display_icon_at_location(player)
      offset = ' '
      spaces = player.location
      icon = icons[player.color.to_sym]
      offset + ('   ' * spaces) + icon
    end

    # icon legend
    def self.icons
      { blue: '🔹', gold: '🔸' }
    end

    # final message to the players
    def self.goodbye(game)
      if game.aborted?
        '[Connect Four] You have ended the game.'
      else
        '[Connect Four] The game has ended.'
      end
    end
  end
end
