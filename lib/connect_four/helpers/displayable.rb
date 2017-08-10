module ConnectFour
  module Displayable
    # generates the grid that is displayed, filling it with current board
    # TODO: refactor this!
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
  end
end
