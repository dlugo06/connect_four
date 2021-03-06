# Connect Four Coding Challenge

Implement the Connect Four game as a command-line app written in Ruby.

If you are not familiar with the game, read the
**[Game Mechanics](index.md#game-mechanics)** and
**[Sample Game Play](index.md#sample-game-play)** sections for a description of
how the game is played and concluded.

We have provided a scaffold project as a starting point. It implements the
minimum required to be able to run the game loop.

Your goal is to complete the rest of the game using the scaffold project as a
starting point.

You'll find the project at https://github.com/jurisgalang/connect_four - clone
it into your own GitHub repo and commit your changes there.

## Task Guidelines

- There is no need to implement an AI or electronic player. The app only needs
  to be able to officiate the game play between human players.
- Feel free to alter the structure and code of the classes that was included in
  the scaffold project to fit your solution.
  
## Evaluation Criteria

1. **Does It Work** - Does the solution run per the instructions?
2. **Design** - Does the solution demonstrate good modularity, extensibility, and separation of concerns? Are appropriate OOP/OOD principles employed?
3. **Readability** - Does the solution display proficiency with the language, a consistent style, and is it understandable? **Hint:** Use of your favorite linter or static anaylsis tool highly encouraged!
4. **Testing** - Do the tests pass, do they verify all the use cases, are they structured well, do they break when unexpected changes are made?
5. **Robustness** - Does the solution work quickly, efficiently, and gracefully handle unexpected situations?

If you have any questions about this criteria please ask.

## Game Mechanics

Connect Four is a two-player connection game in which the players first choose a
color and then take turns dropping colored discs from the top into a
7-columns x 6-rows vertically suspended grid. The pieces fall straight down,
occupying the next available space within the column.

The objective of the game is to be the first to form a horizontal, diagonal, or
vertical line of four of one's own discs.

![winning-positions](/img/winning-positions.png?raw=true "Winning Positions")

The game is a tie if the entire grid is filled with discs and neither player
were able to effect a winning configuration.

See: https://en.wikipedia.org/wiki/Connect_Four

## Sample Game Play

There are two players: Alice (black discs) and Bob (white discs)

1. Alice takes her turn and drops a disc in column 2; the disc slides all the
  way and rests at the bottom.

  ![alices-move](/img/alices-move.jpg?raw=true "Alice's Move")

2. Bob takes his turn and drops a disc also in column 2, the disc
   slides all the way down until it is blocked by Alice's disc.

  ![bobs-move](/img/bobs-move.jpg?raw=true "Bob's Move")

3. The game progresses alternating between Alice and Bob's turn to drop a disc
   at a column of their choice until one of the following conditions occur:

   3a. A horizontal, vertical, or diagonal line of four discs of the same color
       is formed. In which case the player who own the color wins.

   3b. All cells in the grid is occupied by a disc. And if there is no line of
       four discs of the same color, then the game is a tie.
