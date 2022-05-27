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
