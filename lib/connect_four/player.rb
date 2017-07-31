module ConnectFour
  class Player
    attr_reader :name, :color, :location


    def initialize(name)
      @name = name
      @color = nil
      @location = 0
    end

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

    def reset_location
      @location = 0
    end

    def sanitize_location(max)
      target = nil
      if @location < 0
        return reset_location
      elsif @location > max
        target = max
      end
      @location = target unless target.nil?
    end

    def assign_color(index)
      color_list =['blue', 'gold']
      @color = color_list[index % color_list.length]
    end
  end
end
