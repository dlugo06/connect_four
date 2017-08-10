module ConnectFour
  module Displayable
    # request names of players
    # TODO: Allow for more than two players
    def self.gather_names
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

    # clears screen and displays updated grid + current player location
    def self.display_grid_for(player, board)
      system('clear')
      puts "#{player.name}'s turn"
      puts 'Move (L)eft or (R)ight to select where to drop your disc. (Q) to Quit.'
      print display_icon_at_location(player)
      puts display_grid(board.size, board.grid)
    end

    private

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
      output = ' '
      spaces = player.location
      icon = icons[player.color.to_sym]
      output + ('   ' * spaces) + icon
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
