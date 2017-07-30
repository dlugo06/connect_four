require 'bundler/setup'
require 'connect_four'

RSpec.configure do |config|
  def empty_grid(size_arr)
    Array.new(size_arr[0]) { Array.new(size_arr[1]) }
  end

  def winning_grid(type)
    grid = empty_grid

    locations = case type
    when 'h'
       { '1': [[5, 0], [5, 1], [5, 2], [5, 3]]}
    when 'v'
      {'1': [[5, 0], [4, 0], [3, 0], [2, 0]]}
    when 'd'
      { '1': [[5, 1], [5, 2], [5, 3], [4, 2], [4, 3], [3, 3]],
        '2': [[5, 0], [4, 1], [3, 2], [2, 3]] }
    end

    locations.each do |player, values|
      values.each do |pair|
        grid[pair[0]][pair[1]] = player.to_s.to_i
      end
    end

    grid
  end
end
