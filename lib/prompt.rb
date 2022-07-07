# frozen_string_literal: true

require 'message'
require 'board'
require 'input_validation'

# rubocop:disable Metrics/ClassLength
class Prompt
  attr_accessor :board, :custom_marker

  def initialize(board = Board.new)
    @board = board
  end

  def welcome
    print_message(Message.welcome)
  end

  def print_ask_for_custom_marker
    print_message(Message.ask_for_custom_marker)
  end

  def print_ask_to_revisit_game
    print_message(Message.ask_to_revisit_game)
  end

  def print_ask_to_save_game
    print_message(Message.ask_to_save_game)
  end

  def print_show_games_message
    print_message(Message.show_games_message)
  end

  def print_show_results_message
    print_message(Message.show_results_message)
  end

  def print_save_game_success
    print_message(Message.save_game_success)
  end

  def print_save_game_declined
    print_message(Message.save_game_declined)
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

  def print_lite3_board
    print_message(Message.display_lite3_board(@board.board_grid))
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

  def print_invalid_game_mode_error
    print_message(Message.invalid_game_mode_error)
  end

  def print_invalid_save_game_error
    print_message(Message.invalid_save_game_error)
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
    custom_marker.upcase
  end

  def get_players_move(marker)
    player_move = gets.chomp
    print_players_move(marker, player_move.to_i) unless InputValidation.valid_in_game_save_choice?(player_move)
    player_move
  end

  def get_game_mode
    game_mode_choice = gets.chomp.to_i
    until InputValidation.valid_game_choice?(game_mode_choice)
      print_invalid_game_mode_error
      game_mode_choice = gets.chomp.to_i
    end
    print_player_game_mode_choice(game_mode_choice)
    game_mode_choice
  end

  def get_save_game_choice
    save_game_choice = gets.chomp.upcase
    until InputValidation.valid_save_choice?(save_game_choice)
      print_invalid_save_game_error
      save_game_choice = gets.chomp.upcase!
    end
    save_game_choice
  end

  def get_save_in_game_choice
    gets.chomp.upcase
  end

  def get_revisit_game_choice
    revisit_choice = gets.chomp.to_i
    until InputValidation.valid_revisit_choice?(revisit_choice)
      print "\nInvalid selection. Please select 1, 2, or 3\n"
      print_ask_to_revisit_game
      revisit_choice = gets.chomp.to_i
    end
    revisit_choice
  end

  def get_computers_move(marker)
    computer_move = @board.spaces_available[0].to_i
    print_computers_move(marker, computer_move)
    sleep 1
    computer_move
  end

  def validate_unique_markers(marker1, marker2)
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
# rubocop:enable Metrics/ClassLength
