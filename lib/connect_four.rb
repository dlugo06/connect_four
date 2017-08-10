require 'connect_four/version'

module ConnectFour
  autoload :Game,   'connect_four/game'
  autoload :Board,  'connect_four/board'
  autoload :Player, 'connect_four/player'
  autoload :Displayable, 'connect_four/helpers/displayable'
  autoload :Referee, 'connect_four/helpers/referee'
end
