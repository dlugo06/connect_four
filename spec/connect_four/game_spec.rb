require 'spec_helper'

RSpec.describe ConnectFour::Game do
  let(:game) { ConnectFour::Game.new }
  let(:board) { game.instance_variable_get(:@board) }
  let(:players) { game.instance_variable_get(:@players) }
  let(:index) { game.instance_variable_get(:@current_player_index) }

  describe '#initialize' do
    it 'can initialize a game' do
      expect(game).to_not be_nil
    end

    it 'has correct attributes' do
      expect(board).to_not be_nil
      expect(players).to eq []
      expect(index).to be_zero
    end
  end

  describe '#launch' do
    it 'welcomes the players' do
    end

    it 'creates the players from names' do
    end

    it 'exits safely when interrupted' do
    end

    it 'displays results when game is over' do
    end
  end
end
