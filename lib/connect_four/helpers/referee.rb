module ConnectFour
  module Referee

    # returns a player instance if a win is achieved, false otherwise
    # TODO: clean this method up. difficult to read
    def self.connect_four?(board)
      result = false
      (board.size[0] - 1).downto(0) do |y|
        board.grid[y].each_with_index do |disc, x|
          starting = check_location(y, x, board)
          if starting
            player = starting
            vertical_win = vertical_assess([y - 1, x], player, board)
            return vertical_win if vertical_win
            horizontal_win = horizontal_assess([y, x + 1], player, board)
            return horizontal_win if horizontal_win
            diagonal_right_win = diagonal_right_assess([y - 1, x + 1], player, board)
            return diagonal_right_win if diagonal_right_win
            diagonal_left_win = diagonal_left_assess([y - 1, x - 1], player, board)
            return diagonal_left_win if diagonal_left_win
          end
        end
      end
      result
    end

    private

    # basic helper of the connect_four? method. accounts for out of bounds
    # returns instance of player if found, nil otherwise
    def self.check_location(y, x, board)
      return nil if (y == board.size[0] || y < 0) || (x == board.size[1] || x < 0)
      board.grid[y][x]
    end

    # the following 4 methods are massively not DRY
    # TODO: refactor these 4 methods!
    # checks second third and fourth locations of potential connect four.
    # checks a rising diagonal
    def self.diagonal_right_assess(location, player, board)
      second = check_location(location[0], location[1], board)
      third = check_location(location[0] - 1, location[1] + 1, board)
      fourth = check_location(location[0] - 2, location[1] + 2, board)
      if (second == player) && (third == player) && (fourth == player)
        return player
      end
      false
    end

    # checks second third and fourth locations of potential connect four.
    # checks a dropping diagonal
    def self.diagonal_left_assess(location, player, board)
      second = check_location(location[0], location[1], board)
      third = check_location(location[0] - 1, location[1] - 1, board)
      fourth = check_location(location[0] - 2, location[1] - 2, board)
      if (second == player) && (third == player) && (fourth == player)
        return player
      end
      false
    end

    # checks second third and fourth locations of potential connect four.
    # checks vertical axis
    def self.vertical_assess(location, player, board)
      second = check_location(location[0], location[1], board)
      third = check_location(location[0] - 1, location[1], board)
      fourth = check_location(location[0] - 2, location[1], board)
      if (second == player) && (third == player) && (fourth == player)
        return player
      end
      false
    end

    # checks second third and fourth locations of potential connect four.
    # checks horizontal axis
    def self.horizontal_assess(location, player, board)
      second = check_location(location[0], location[1], board)
      third = check_location(location[0], location[1] + 1, board)
      fourth = check_location(location[0], location[1] + 2, board)
      if (second == player) && (third == player) && (fourth == player)
        return player
      end
      false
    end
  end
end
