# frozen_string_literal: true

require 'player_builder'
require 'prompt'
require 'game'
require 'database_actions'
require 'game_builder'

class GameRunner
  def begin_session
    initialize_game
    start_game
  end

  def initialize_game
    @prompt = Prompt.new
    @prompt.welcome
    @database_actions = DatabaseActions.new('tic_tac_toe.db')

    game_mode_choice = get_game_mode
    @prompt.print_ask_for_custom_marker

    player1_marker = get_player_marker(1)
    player2_marker =
      @prompt.validate_unique_markers(player1_marker, get_player_marker(2))

    @markers = [player1_marker, player2_marker]

    @game_builder = GameBuilder.new(game_mode_choice)

    @game = @game_builder.build_game(@markers)
  end

  def get_player_marker(player)
    @prompt.print_player_custom_marker(player)
    player_choice = @prompt.get_custom_marker
    @prompt.print_player_custom_marker_choice(player, player_choice)
    player_choice
  end

  def get_game_mode
    @prompt.print_game_mode_prompt
    @prompt.get_game_mode
  end

  def start_game
    @game.start_game
  end
end
