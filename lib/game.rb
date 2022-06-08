# frozen_string_literal: true

require 'prompt'
require 'input_validation'
require 'board'

class Game
  attr_reader :board, :prompt, :player1, :player2, :current_player, :winning_player

  def initialize(board, prompt, player1, player2)
    @board = board
    @prompt = prompt
    @player1 = player1
    @player2 = player2
    @current_player = player1
    @winning_player = player1
  end

  def start_game
    @prompt.print_board
    turn
  end

  def turn
    until game_over?
      @prompt.print_current_player(@current_player.marker)
      @prompt.print_instruction
      play_turn(@current_player, @current_player.get_move)
      @prompt.print_board
    end

    status
  end

  def play_turn(player, move)
    if valid_move?(move)
      update_board(player, move)
      set_winning_player(player) if @board.winner?
      update_current_player
    else
      @prompt.print_invalid_move_error
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

  def set_winning_player(winning_player)
    @winning_player = winning_player
  end

  def valid_move?(input)
    !@board.spot_taken?(input) && InputValidation.valid_number?(input)
  end

  def status
    board.full? && !board.winner? ? @prompt.print_tie : @prompt.print_winner(@winning_player.marker)
  end
end
