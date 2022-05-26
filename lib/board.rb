# frozen_string_literal: true

class Board
  attr_accessor :board_grid

  # #initialize board
  def intialize
    @board_grid = %w[1 2 3 4 5 6 7 8 9]
  end

  def self.display_board
    "\n 1 | 2 | 3 \n---|---|---\n 4 | 5 | 6  \n---|---|---\n 7 | 8 | 9 \n\n\n"
  end
end
