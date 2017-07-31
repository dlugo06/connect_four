module ConnectFour
  class Player
    attr_reader :name, :color, :location

    def initialize(name)
      @name = name
      @color = nil
      @location = 0 # current player location, resets after every Game#play loop
    end

    # registers the move by the player. updates location accordingly.
    def move
      print "[#{name}]: "
      result = STDIN.gets.chomp.downcase
      if result  == 'l'
        @location -= 1
      elsif result == 'r'
        @location += 1
      end
      result
    end

    # resets location. Called after every Game#play loop
    def reset_location
      @location = 0
    end

    # adjusts location in case < 0 or > columns so that player location does not go off the board
    def sanitize_location(max)
      target = nil
      if @location < 0
        return reset_location
      elsif @location > max
        target = max
      end
      @location = target unless target.nil?
    end

    # assigns a color to each player based on player index set by Game
    def assign_color(index)
      color_list =['blue', 'gold']
      @color = color_list[index % color_list.length]
    end
  end
end
