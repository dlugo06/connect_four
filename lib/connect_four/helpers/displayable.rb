module ConnectFour
  module Displayable
    # generates the grid that is displayed, filling it with current board
    # TODO: refactor this!
    def grid_string
      str = "\n"
      (@size[0]).times do |y|
        (@size[1]).times do |x|
          str += %(|#{display_disc(y, x)} )
        end
        str += "|\n"
      end
      str
    end

    # used to display a 'disc' based on location and contents (nil or player)
    def display_disc(y, x)
      disc = @grid[y][x]
      disc.nil? ? ' ' : icons[disc.color.to_sym]
    end

    # used to properly align the current player location w/ game board
    def display_icon_at_location(player)
      output = ' '
      spaces = player.location
      icon = icons[player.color.to_sym]
      output + ('   ' * spaces) + icon
    end
  end
end
