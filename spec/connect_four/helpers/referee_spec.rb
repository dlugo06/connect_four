require 'spec_helper'
require 'board_spec_helper'

RSpec.describe ConnectFour::Referee do
  let(:board) { ConnectFour::Board.new }
  let(:player1) { ConnectFour::Player.new('alice') }
  let(:player2) { ConnectFour::Player.new('bob') }
  let(:referee) { ConnectFour::Referee }
  let(:h_win) { winning_grid('h') }
  let(:v_win) { winning_grid('v') }
  let(:d_win) { winning_grid('d') }

    describe '::connect_four?' do
      context 'win' do
        it 'verifies horizontal win' do
          board.instance_variable_set(:@grid, h_win)
          expect(referee.connect_four?(board)).to eq player1
        end

        it 'verifies vertical win' do
          board.instance_variable_set(:@grid, v_win)
          expect(referee.connect_four?(board)).to eq player1
        end

        it 'verifies diagonal win' do
          board.instance_variable_set(:@grid, d_win)
          expect(referee.connect_four?(board)).to eq player2
        end
      end

      context 'no winner yet' do
        it 'returns false when there is no winner' do
        end
      end
    end
end
