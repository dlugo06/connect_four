require 'spec_helper'

RSpec.describe ConnectFour::Player do
  let(:game) { ConnectFour::Game.new }
  let(:player1) { ConnectFour::Player.new('alice') }

  describe '#initialize' do
    it 'can initialize a player' do
    end

    it 'has correct attributes' do
    end
  end

  describe '#move' do
    it 'updates player location' do
    end
  end

  describe '#reset_location' do
    it 'sets location back to 0' do
    end
  end

  describe '#sanitize_location' do
    it 'adjusts location when < 0' do
    end

    it 'adjusts location when > columns' do
    end
  end

  describe '#assign_color' do
    it 'sets player color based on index' do
    end
  end
end
