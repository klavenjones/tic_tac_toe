# frozen_string_literal: true

require 'prompt'
require 'input_validation'
require 'board'

class Game
  attr_reader :board, :prompt, :player1, :player2, :current_player, :winning_player

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
    until game_over?
      Prompt.print_current_player(@current_player.marker)
      Prompt.print_instruction
      play_turn(@current_player, @current_player.get_move)
      Prompt.print_message(@board.display_board)
    end

    status
  end

  def play_turn(player, move)
    if valid_move?(move)
      update_board(player, move)
      update_current_player
    else
        Prompt.print_invalid_move_error
        sleep 2
    end
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

  def game_over?
    @board.full? || @board.winner?
  end

  def determine_winner
    @board.board_grid.count(player1.marker) > @board.board_grid.count(player2.marker) ? player1.marker : player2.marker
  end

  def valid_move?(input)
    !@board.spot_taken?(input) && InputValidation.valid_number?(input)
  end

  def status
    board.full? && !board.winner? ? Prompt.print_tie : Prompt.print_winner(determine_winner)
  end
end
