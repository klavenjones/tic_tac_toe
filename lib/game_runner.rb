# frozen_string_literal: true

require 'player_builder'
require 'prompt'
require 'game'
require 'game_database_actions'
require 'results_database_actions'
require 'game_builder'

class GameRunner
  def begin_session
    initialize_game
    start_game
  end

  def initialize_game
    @prompt = Prompt.new
    @prompt.welcome

    @game_database_actions = GameDatabaseActions.new('tic_tac_toe.db')
    @results_database_actions = ResultsDatabaseActions.new('tic_tac_toe.db')

    game_mode_choice = get_game_mode
    @prompt.print_ask_for_custom_marker
    player1_marker = get_player_marker(1)
    player2_marker =
      @prompt.validate_unique_markers(player1_marker, get_player_marker(2))

    @players = [
      build_player(@prompt, player1_marker, game_mode_choice),
      build_player(@prompt, player2_marker)
    ]

    @game =
      build_game(
        game_mode_choice: game_mode_choice,
        board: @board,
        prompt: @prompt,
        players: @players,
        game_database_actions: @game_database_actions,
        results_database_actions: @results_database_actions
      )
  end

  def build_player(prompt, marker, game_mode_choice = 1)
    player_builder =
      if [2, 4].include?(game_mode_choice)
        PlayerBuilder.new('Computer')
      else
        PlayerBuilder.new
      end
    player_builder.set_player_prompt(prompt)
    player_builder.set_player_marker(marker)
    player_builder.player
  end

  def build_game(args)
    game_builder = GameBuilder.new(args[:game_mode_choice])
    game_builder.set_board
    args[:prompt].board = game_builder.board
    game_builder.set_prompt(args[:prompt])
    game_builder.set_players(args[:players])
    game_builder.set_game_database_actions(args[:game_database_actions])
    game_builder.set_results_database_actions(args[:results_database_actions])
    game_builder.set_game
    game_builder.game
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
