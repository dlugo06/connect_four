require 'spec_helper'

RSpec.describe ConnectFour::Board do
  let(:board) { ConnectFour::Board.new }

  describe '#initialize' do
    it 'can initialize a board' do
      expect(board).to_not be_nil
    end

    it 'has correct size' do
      expect(board).to respond_to :size
      expect(board).to have_attributes(size: [6, 7])
    end
  end

  describe '#play' do

  end

  describe '#connect_four?' do

  end

  describe '#full?' do

  end

  describe '#render' do

  end

  describe '#update' do

  end
end
