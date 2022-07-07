# frozen_string_literal: true

class Lite3Board
  attr_accessor :board_grid

  def initialize
    @board_grid = [
      { marker: '1', time_on_board: 0, space_index: 0 },
      { marker: '2', time_on_board: 0, space_index: 1 },
      { marker: '3', time_on_board: 0, space_index: 2 },
      { marker: '4', time_on_board: 0, space_index: 3 },
      { marker: '5', time_on_board: 0, space_index: 4 },
      { marker: '6', time_on_board: 0, space_index: 5 },
      { marker: '7', time_on_board: 0, space_index: 6 },
      { marker: '8', time_on_board: 0, space_index: 7 },
      { marker: '9', time_on_board: 0, space_index: 8 }
    ]
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

  def mark_board(player, move)
    @board_grid[move - 1][:marker] = player
  end

  def taken_spaces
    count = 0
    @board_grid.each do |space|
      count += 1 if space[:marker].match(/^[[:alpha:]]$/)
    end
    count
  end

  def spaces_available
    spaces = []
    @board_grid.each do |space|
      spaces << (space[:space_index] + 1).to_s unless space[:marker].match(/^[[:alpha:]]$/)
    end
    spaces
  end

  def spot_taken?(spot)
    if spot > @board_grid.length
      false
    else
      @board_grid[spot - 1][:marker] != spot.to_s
    end
  end

  def full?
    taken_spaces >= @board_grid.length
  end

  def winner?
    winning_moves = []
    WINNING_COMBOS.each do |winning_game|
      first_space_eq_second_space = @board_grid[winning_game[0]][:marker] == @board_grid[winning_game[1]][:marker]
      second_space_eq_third_space = @board_grid[winning_game[1]][:marker] == @board_grid[winning_game[2]][:marker]
      winning_moves.push(first_space_eq_second_space && second_space_eq_third_space ? true : false)
    end
    winning_moves.any? { |game| game == true }
  end
end
