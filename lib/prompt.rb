# frozen_string_literal: true

require 'message'
require 'board'

class Prompt
  attr_accessor :board

  def initialize(board)
    @board = board
  end

  def welcome
    print_message(Message.welcome)
  end

  def print_instruction
    print_message(Message.instruction)
  end

  def print_board
    print_message(@board.display_board)
    sleep 2
  end

  def print_tie
    print_message(Message.tie)
  end

  def print_winner(marker)
    print_message(Message.winner(marker))
  end

  def print_current_player(marker)
    print_message(Message.current_player(marker))
  end

  def print_players_move(marker, move)
    print_message(Message.players_move(marker, move))
  end

  def print_computers_move(marker, move)
    print_message(Message.computers_move(marker, move))
  end

  def print_invalid_move_error
    print_message(Message.invalid_move_error)
  end

  def get_players_move(marker)
    player_move = gets.chomp.to_i
    print_players_move(marker, player_move)
    player_move
  end

  def get_computers_move(marker)
    computer_move = @board.spaces_available[0].to_i
    print_computers_move(marker, computer_move)
    sleep 1.5
    computer_move
  end

  def print_message(msg)
    print msg
  end
end
