# frozen_string_literal: true

require 'message'
require 'board'

class Prompt
  @board = Board.new

  def self.welcome
    print_message(Message.welcome)
  end

  def self.print_instruction
    print_message(Message.instruction)
  end

  def self.print_board
    print_message(@board.display_board)
  end

  def self.print_tie
    print_message(Message.tie)
  end

  def self.print_winner(marker)
    print_message(Message.winner(marker))
  end

  def self.print_current_player(marker)
    print_message(Message.current_player(marker))
  end

  def self.print_players_move(marker, move)
    print_message(Message.players_move(marker, move))
  end

  def self.print_invalid_move_error
    print_message(Message.invalid_move_error)
  end

  def get_players_move(marker)
    player_move = gets.chomp.to_i
    self.class.print_players_move(marker, player_move)
    sleep 1.5
    player_move
  end

  def get_computers_move(marker)
    computer_move = @board.spaces_available[0].to_i
    self.class.print_computers_move(marker, computer_move)
    sleep 1.5
    computer_move
  end

  def self.print_message(msg)
    print msg
  end
end
