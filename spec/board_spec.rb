# frozen_string_literal: true

require 'board'

describe Board do
  subject(:board) { Board.new }

  describe '#display_board' do
    it 'should return the board' do
      expect(board.display_board).to eq(
        "\n 1 | 2 | 3 \n---|---|---\n 4 | 5 | 6  \n---|---|---\n 7 | 8 | 9 \n\n\n"
      )
    end
  end

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
end

## Utility Methods
def verify_position_one(marker)
  board = Board.new
  board.mark_board(marker, 1)

  expect(board.display_board).to eq(
    "\n #{marker} | 2 | 3 \n---|---|---\n 4 | 5 | 6  \n---|---|---\n 7 | 8 | 9 \n\n\n"
  )
end

def verify_position_nine(marker)
  board = Board.new
  board.mark_board(marker, 9)
  expect(board.display_board).to eq(
    "\n 1 | 2 | 3 \n---|---|---\n 4 | 5 | 6  \n---|---|---\n 7 | 8 | #{marker} \n\n\n"
  )
end
