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

  describe '#connect_four?' do
    context 'win' do
      it 'verifies horizontal win' do
        board.instance_variable_set(:@grid, h_win)
        expect(board.connect_four?).to eq player1
      end

      it 'verifies vertical win' do
        board.instance_variable_set(:@grid, v_win)
        expect(board.connect_four?).to eq player1
      end

      it 'verifies diagonal win' do
        board.instance_variable_set(:@grid, d_win)
        expect(board.connect_four?).to eq player2
      end
    end

    context 'no winner yet' do
      it 'returns false when there is no winner' do
      end
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

  describe '#check_location' do
    it 'returns nil if out of bounds' do
    end

    it 'returns nil if it equals nil' do
    end

    it 'returns a player instance if found' do
    end
  end

  describe 'assessors' do
    context 'vertical' do
      it 'checks 3 values above' do
      end
    end

    context 'horizontal' do
      it 'checks 3 values to the right' do
      end
    end

    context 'diagonal' do
      it 'checks 3 values diagonally up and right' do
      end

      it 'checks 3 values diagonally up and left' do
      end
    end
  end

  describe '#create_grid_from_size' do
    it 'creates empty grid' do
      expect(board.grid).to eq empty_grid(board.size)
    end
  end
end
