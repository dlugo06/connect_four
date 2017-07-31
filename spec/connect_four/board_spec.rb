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

    context 'draw' do
    end

    context 'no winner yet' do
    end
  end

  describe '#full?' do

  end

  describe '#update' do

  end

  describe '#create_grid_from_size' do
    it 'creates empty grid' do
      expect(board.grid).to eq empty_grid(board.size)
    end
  end

  describe '#display_grid_for' do
    before(:example) do
      allow(board).to receive(:system)
      suppress_stdin('l')
    end

    it 'displays a grid with icons' do
      board.instance_variable_set(:@grid, d_win)
      expect{ board.send(:display_grid_for, player1) }.to output(include('🔹', '🔸')).to_stdout
      expect{ board.send(:display_grid_for, player1) }.to_not output(include('nil')).to_stdout
    end
  end
end
