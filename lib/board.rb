# frozen_string_literal: true

class Board
  attr_accessor :board_grid

  def initialize
    @board_grid = %w[1 2 3 4 5 6 7 8 9]
  end

  def display_board
    "\n #{@board_grid[0]} | #{@board_grid[1]} | #{@board_grid[2]} \n---|---|---\n #{@board_grid[3]} | #{@board_grid[4]} | #{@board_grid[5]}  \n---|---|---\n #{@board_grid[6]} | #{@board_grid[7]} | #{@board_grid[8]} \n\n\n"
  end

  def mark_board(player, move)
    @board_grid[move - 1] = player
  end
end
