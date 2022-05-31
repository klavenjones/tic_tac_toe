# frozen_string_literal: true

require 'prompt'
require 'board'

class Game
  attr_reader :board, :prompt, :player1, :player2

  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
    @current_player = player1
  end

  def start_game
    Prompt.print_message(@board.display_board)
    turn
  end

  def turn
    Prompt.print_current_player(@current_player.marker)
    Prompt.print_instruction
    play_turn(@current_player, @current_player.get_move)

    Prompt.print_message(@board.display_board)
  end

  def play_turn(player, move)
    update_board(player, move)
    update_current_player
  end

  def update_board(player, move)
    player == @player1 ? @board.mark_board(@player1.marker, move) : @board.mark_board(@player2.marker, move)
  end

  def update_current_player
    @current_player == @player1 ? set_current_player(@player2) : set_current_player(@player1)
  end

  def set_current_player(current_player)
    @current_player = current_player
  end
end
