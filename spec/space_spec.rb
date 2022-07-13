# frozen_string_literal: true

require 'space'

describe Space do
  before(:all) { @space = Space.new('1', 0) }

  describe '#update_marker' do
    it 'should return X as the updated marker' do
      @space.update_marker('X')
      expect(@space.marker).to eq('X')
    end
  end

  describe '#reset_marker' do
    it 'should return the default marker of 1 when the marker is reset' do
      @space.update_marker('X')
      expect(@space.marker).to eq('X')
      @space.reset_marker
      expect(@space.marker).to eq('1')
    end
  end

  describe '#time_on_board' do
    it 'should return the default marker of 1 when the marker is reset' do
      @space.update_time_on_board
      expect(@space.time_on_board).to eq(1)
      @space.update_time_on_board
      expect(@space.time_on_board).to eq(2)
    end
  end
end
