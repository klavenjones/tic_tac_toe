# frozen_string_literal: true

require 'space'

class Board
  attr_accessor :board_grid

  def initialize
    @board_grid = build_board
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

  def build_board
    board = []
    (1..9).each_with_index { |space, index| board.push(Space.new(space.to_s, index)) }
    board
  end

  def update_board(player, move)
    mark_board(player, move)
  end

  def update_space
    @board_grid.each do |space|
      space.update_time_on_board unless space.marker.match(/^[[:digit:]]$/)
      if space.time_on_board > 4
        space.reset_marker
        space.reset_time_on_board
      end
    end
  end

  def mark_board(player, move)
    @board_grid[move - 1].update_marker(player)
  end

  def taken_spaces
    count = 0
    @board_grid.each { |space| count += 1 if space.marker.match(/^[[:alpha:]]$/) }
    count
  end

  def spaces_available
    spaces = []
    @board_grid.each do |space|
      spaces.push(space) unless space.marker.match(/^[[:alpha:]]$/)
    end
    spaces
  end

  def spot_taken?(spot)
    if spot > @board_grid.length
      false
    else
      @board_grid[spot - 1].marker != spot.to_s
    end
  end

  def full?
    taken_spaces >= @board_grid.length
  end

  def winner?
    winning_moves = []
    WINNING_COMBOS.each do |winning_game|
      first_space_eq_second_space = @board_grid[winning_game[0]].marker == @board_grid[winning_game[1]].marker
      second_space_eq_third_space = @board_grid[winning_game[1]].marker == @board_grid[winning_game[2]].marker
      winning_moves.push(first_space_eq_second_space && second_space_eq_third_space ? true : false)
    end
    winning_moves.any? { |game| game == true }
  end
end
