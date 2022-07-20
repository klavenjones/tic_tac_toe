# frozen_string_literal: true

module RspecUtilMethods
  def update_board_x_times(board, count)
    (1..count).each do |space|
      board.update_board('X', space)
    end
  end

  def update_game_board_x_times(board, count)
    (1..count).each do |turn|
      marker = turn.even? ? 'O' : 'X'
      board.update_board(marker, turn)
    end
  end

  def mark_board_as_winner(board)
    board.mark_board('X', 1)
    board.mark_board('X', 2)
    board.mark_board('X', 3)
    board.mark_board('O', 4)
    board.mark_board('O', 5)
  end

  def mark_board_as_tie(board)
    board.mark_board('O', 1)
    board.mark_board('O', 2)
    board.mark_board('X', 3)
    board.mark_board('X', 4)
    board.mark_board('X', 5)
    board.mark_board('O', 6)
    board.mark_board('O', 7)
    board.mark_board('O', 8)
    board.mark_board('X', 9)
  end

  def build_player(player_builder, prompt, marker)
    builder = player_builder
    builder.set_player_prompt(prompt)
    builder.set_player_marker(marker)
    builder.player
  end
end
