# frozen_string_literal: true

require 'lite3_board'
require 'prompt'

describe Lite3Board do
  subject(:board) { described_class.new }
  let(:prompt) { Prompt.new(board) }

  describe '#mark_board' do
    it 'should verify that the player marked position number one (Top left corner)' do
      verify_position_one('X')
      verify_position_one('O')
    end

    it 'should verify that the player marked position number nine (Bottom right corner)' do
      verify_position_nine('X')
      verify_position_nine('O')
    end
  end

  describe '#taken_spaces' do
    it 'should return the amount if only one space is taken' do
      board.mark_board('X', 1)
      expect(board.taken_spaces).to eq(1)
    end

    it 'should return the amount if 3 spaces were spaces taken' do
      board.mark_board('X', 1)
      board.mark_board('X', 9)
      board.mark_board('X', 2)
      expect(board.taken_spaces).to eq(3)
    end
  end

  describe '#full?' do
    it 'should display true when the board is full' do
      board.board_grid.each_with_index do |_item, index|
        board.mark_board('X', index)
      end
      expect(board.full?).to eq(true)
    end

    it 'should display false when the board is not full' do
      expect(board.full?).to eq(false)
    end
  end

  describe '#winner?' do
    it 'should display true if there is a winner' do
      (1..3).each do |i|
        board.mark_board('X', i)
      end
      expect(board.winner?).to eq(true)
    end
  end

  describe '#spot_taken?' do
    it 'should return true if the space is taken' do
      board.mark_board('X', 1)
      expect(board.spot_taken?(1)).to eq(true)
    end

    it 'should return false if the space is available' do
      expect(board.spot_taken?(1)).to eq(false)
    end
  end

  describe '#spaces_available' do
    it 'should return an array of available spaces on the board, when the first spot is taken' do
      board.mark_board('X', 1)
      print board.spaces_available
      expect(board.spaces_available).to eq(%w[2 3 4 5 6 7 8 9])
    end

    it 'should return an empty array when there are no spots left' do
      fill_board(board)
      expect(board.spaces_available).to eq([])
    end
  end
end

## Utility Methods
def verify_position_one(marker)
  board = Lite3Board.new
  prompt = Prompt.new(board)
  board.mark_board(marker, 1)
  expect { prompt.print_lite3_board }.to output(
    "\n #{board.board_grid[0][:marker]} | 2 | 3 \n---|---|---\n 4 | 5 | 6  \n---|---|---\n 7 | 8 | 9 \n\n\n"
  ).to_stdout
end

def verify_position_nine(marker)
  board = Lite3Board.new
  prompt = Prompt.new(board)
  board.mark_board(marker, 9)
  expect { prompt.print_lite3_board }.to output(
    "\n 1 | 2 | 3 \n---|---|---\n 4 | 5 | 6  \n---|---|---\n 7 | 8 | #{marker} \n\n\n"
  ).to_stdout
end

def fill_board(board)
  (1..9).each do |i|
    board.mark_board('X', i)
  end
end
