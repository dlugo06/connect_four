module ConnectFour
  module Referee

    # returns a player instance if a win is achieved, false otherwise
    # TODO: clean this method up. difficult to read
    def self.connect_four?(board)
      result = false
      (board.size[0] - 1).downto(0) do |y|
        board.grid[y].each_with_index do |disc, x|
          assessor_types = ['dr', 'dl', 'v', 'h']
          assessor_types.each do |type|
            winner = assessor(y, x, board, type)
            return winner if winner
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

    # will check for a win of the given type
    def self.assessor(y, x, board, type)
      operators = case type
      when 'dr'
        [:-, :+]
      when 'dl'
        [:-, :-]
      when 'v'
        [:-, :itself]
      when 'h'
        [:itself, :+]
      end

      player = check_location(y, x, board)
      comparison = []
      player ? comparison << player : (return false)
      current = []
      4.times do |i|
        current << if operators[0] == :itself && operators[1] != :itself
          check_location(y.public_send(operators[0]), x.public_send(operators[1], i), board)
        elsif operators[1] == :itself && operators[0] != :itself
          check_location(y.public_send(operators[0], i), x.public_send(operators[1]), board)
        else
          check_location(y.public_send(operators[0], i), x.public_send(operators[1], i), board)
        end
        return false unless comparison == current
        comparison << player
      end
      player
    end
  end
end
