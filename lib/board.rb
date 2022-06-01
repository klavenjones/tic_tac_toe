# frozen_string_literal: true

class Board
  attr_accessor :board_grid

  def initialize
    @board_grid = %w[1 2 3 4 5 6 7 8 9]
  end

  WINNING_COMBOS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ].freeze

  def display_board
    "\n #{@board_grid[0]} | #{@board_grid[1]} | #{@board_grid[2]} \n---|---|---\n #{@board_grid[3]} | #{@board_grid[4]} | #{@board_grid[5]}  \n---|---|---\n #{@board_grid[6]} | #{@board_grid[7]} | #{@board_grid[8]} \n\n\n"
  end

  def mark_board(player, move)
    @board_grid[move - 1] = player
  end

  def taken_spaces
    count = 0
    @board_grid.each { |space| count += 1 if %w[X O].include?(space) }
    count
  end

  def spot_taken?(spot)
    !@board_grid.include?(spot.to_s)
  end

  def full?
    taken_spaces >= 9
  end

  def winner?
    winning_moves = []
    WINNING_COMBOS.all? do |winning_game|
      first_space_eq_second_space = @board_grid[winning_game[0]] == @board_grid[winning_game[1]]
      second_space_eq_third_space = @board_grid[winning_game[1]] == @board_grid[winning_game[2]]
      winning_moves.push(first_space_eq_second_space && second_space_eq_third_space ? true : false)
    end
    winning_moves.any? { |game| game == true }
  end
end
