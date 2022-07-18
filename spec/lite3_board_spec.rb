# frozen_string_literal: true

$LOAD_PATH << './util'
require 'rspec_utils'
require 'lite3_board'
require 'board'

describe Lite3Board do
  include RspecUtilMethods

  before(:each) do
    @lite3_board = Lite3Board.new
  end

  it 'should be a child of the Board class' do
    expect(Lite3Board).to be < Board
  end

  describe '#update_board' do
    it 'should return the updated space' do
      update_board_x_times(@lite3_board, 1)
      expect(@lite3_board.board_grid[0].marker).to eq('X')
    end
    it 'should reset the time_on_board when the board is updated more then 4 times' do
      update_board_x_times(@lite3_board, 5)
      print @lite3_board.board_grid[0].marker
      expect(@lite3_board.board_grid[0].time_on_board).to eq(0)
    end
  end

  describe '#update_space' do
    it 'should return the updated time on board of 1' do
      @lite3_board.mark_board('X', 1)
      @lite3_board.update_space
      expect(@lite3_board.board_grid[0].time_on_board).to eq(1)
    end
  end
end
