# frozen_string_literal: true

require 'board'

class Lite3Board < Board
  def update_board(player, move)
    mark_board(player, move)
    update_space
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
end
