require 'spec_helper'
require 'board_spec_helper'

RSpec.describe ConnectFour::Displayable do
  let(:board) { ConnectFour::Board.new }
  let(:player1) { ConnectFour::Player.new('alice') }
  let(:player2) { ConnectFour::Player.new('bob') }
  let(:d_win) { winning_grid('d') }
  let(:displayable) { ConnectFour::Displayable }

  describe '::gather_names' do
    it 'returns a list of names' do
      suppress_stdout
      suppress_stdin('alice')
      names = displayable.gather_names
      expect(names).to eq(['Alice', 'Alice'])
    end
  end

  describe '::summarize' do
    let(:game) { ConnectFour::Game.new }
    
    it 'displays the winner when there is a winner' do
      allow(game).to receive(:winner).and_return(player2)
      expect{ displayable.summarize(game) }. to output("\nCongratuations! bob has won!\n[Connect Four] The game has ended.\n").to_stdout
    end

    it 'states there is a tie if the board is full' do
      allow(game.board).to receive(:full?).and_return(true)
      expect{ displayable.summarize(game) }. to output("\nThe board is full, the game is a tie.\n[Connect Four] The game has ended.\n").to_stdout
    end

    it 'states a player has ended the game if aborted? == true' do
      allow(game).to receive(:aborted?).and_return(true)
      expect{ displayable.summarize(game) }. to output("\n[Connect Four] You have ended the game.\n").to_stdout
    end
  end

  describe '::display_grid_for' do
    before(:example) do
      allow(displayable).to receive(:system)
      suppress_stdin('l')
    end

    it "displays the player's name" do
      player1.instance_variable_set(:@color, 'blue')
      expect{ displayable.display_grid_for(player1, board) }.to output(include('alice')).to_stdout
    end

    it 'displays a grid with icons' do
      board.instance_variable_set(:@grid, d_win)
      expect{ displayable.display_grid_for(player1, board) }.to output(include('🔹', '🔸')).to_stdout
      expect{ displayable.display_grid_for(player1, board) }.to_not output(include('nil')).to_stdout
    end
  end
end
