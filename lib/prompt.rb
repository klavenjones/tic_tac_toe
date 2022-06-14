# frozen_string_literal: true

require 'message'
require 'board'
require 'input_validation'

class Prompt
  attr_accessor :board, :custom_marker

  def initialize(board)
    @board = board
  end

  def welcome
    print_message(Message.welcome)
  end

  def print_ask_for_custom_marker
    print_message(Message.ask_for_custom_marker)
  end

  def print_game_mode_prompt
    print_message(Message.game_mode_prompt)
  end

  def print_player_game_mode_choice(choice)
    print_message(Message.player_game_mode_choice(choice))
  end

  def print_player_custom_marker(player)
    print_message(Message.player_custom_marker(player))
  end

  def print_player_custom_marker_choice(player, marker)
    print_message(Message.player_custom_marker_choice(player, marker))
  end

  def print_instruction
    print_message(Message.instruction)
  end

  def print_board
    print_message(Message.display_board(@board.board_grid))
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

  def print_invalid_marker_error
    print_message(Message.invalid_marker_error)
  end

  def print_duplicate_marker_error
    print_message(Message.duplicate_marker_error)
  end

  def get_custom_marker
    @custom_marker = gets.chomp
    until InputValidation.valid_marker?(custom_marker)
      print_invalid_marker_error
      @custom_marker = gets.chomp
    end
    custom_marker.upcase!
  end

  def get_players_move(marker)
    player_move = gets.chomp.to_i
    print_players_move(marker, player_move)
    player_move
  end

  def get_game_mode
    game_mode_choice = gets.chomp.to_i
    print_player_game_mode_choice(game_mode_choice)
    game_mode_choice
  end

  def get_computers_move(marker)
    computer_move = @board.spaces_available[0].to_i
    print_computers_move(marker, computer_move)
    sleep 1.5
    computer_move
  end

  def validate_unique_markers?(marker1, marker2)
    while InputValidation.marker_taken?(marker1, marker2)
      print_duplicate_marker_error
      marker2 = get_custom_marker
    end
    marker2
  end

  def print_message(msg)
    print msg
  end
end
