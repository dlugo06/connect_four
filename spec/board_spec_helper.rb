require 'bundler/setup'
require 'connect_four'

RSpec.configure do |config|
  def empty_grid(size_arr)
    Array.new(size_arr[0]) { Array.new(size_arr[1]) }
  end

  def winning_grid(type)
    players = [player1, player2]
    players.each_with_index { |player, i| player.assign_color(i) }
    grid = empty_grid(board.size)

    locations = case type
    when 'h'
       { '1': [[5, 0], [5, 1], [5, 2], [5, 3]],
         '2': [[5, 6], [4, 6], [3, 6]]
       }
    when 'v'
      { '1': [[5, 0], [4, 0], [3, 0], [2, 0]],
        '2': [[5, 6], [5, 4], [5, 3]]
      }
    when 'd'
      { '1': [[5, 1], [5, 2], [5, 3], [4, 2], [4, 3], [3, 3]],
        '2': [[5, 0], [4, 1], [3, 2], [2, 3]] }
    end

    locations.each do |player, values|
      disc = player == '1'.to_sym ? players[0] : players[1]
      values.each do |pair|
        grid[pair[0]][pair[1]] = disc
      end
    end

    grid
  end
end
