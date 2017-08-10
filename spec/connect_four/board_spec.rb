require 'spec_helper'
require 'board_spec_helper'

RSpec.describe ConnectFour::Board do
  let(:board) { ConnectFour::Board.new }
  let(:player1) { ConnectFour::Player.new('alice') }
  let(:player2) { ConnectFour::Player.new('bob') }
  let(:h_win) { winning_grid('h') }
  let(:v_win) { winning_grid('v') }
  let(:d_win) { winning_grid('d') }

  describe '#initialize' do
    it 'can initialize a board' do
      expect(board).to_not be_nil
    end

    it 'has correct attributes' do
      expect(board).to have_attributes(size: [6, 7], grid: empty_grid([6, 7]))
    end
  end

  describe '#update' do
    it 'updates the grid with gravity physics!' do
    end
  end

  describe '#full?' do
    it 'correctly assesses if board if full' do
    end
  end

  describe '#full_column?' do
    it 'correctly displays if a column is full' do
    end
  end

  describe '#create_grid_from_size' do
    it 'creates empty grid' do
      expect(board.grid).to eq empty_grid(board.size)
    end
  end
end
