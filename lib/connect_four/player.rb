module ConnectFour
  class Player
    attr_reader :name, :color


    def initialize(name)
      @name = name
      @color = nil
    end

    def move
      print "[#{name}]: "
      STDIN.gets.chomp.downcase
    end

    def assign_color(index)
      color_list =['blue', 'gold']
      @color = color_list[index % color_list.length]
    end
  end
end
