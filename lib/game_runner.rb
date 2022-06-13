# frozen_string_literal: true

require 'player_builder'
require 'prompt'
require 'game'
require 'board'

class GameRunner
  def begin_session
    initialize_game
    start_game
  end

  def initialize_game
    @board = Board.new
    @prompt = Prompt.new(@board)

    @prompt.welcome
    @prompt.print_ask_for_custom_marker

    player1_marker = get_player_marker(1)
    player2_marker = get_player_marker(2)

    player2_marker = @prompt.validate_unique_markers?(player1_marker, player2_marker)

    @player1 = build_player(@prompt, player1_marker)
    @player2 = build_player(@prompt, player2_marker)

    @game = Game.new(@board, @prompt, @player1, @player2)
  end

  def build_player(prompt, marker)
    builder = PlayerBuilder.new
    builder.set_player_prompt(prompt)
    builder.set_player_marker(marker)
    builder.player
  end

  def get_player_marker(player)
    @prompt.print_player_custom_marker(player)
    player_choice = @prompt.get_custom_marker
    @prompt.print_player_custom_marker_choice(player, player_choice)
    player_choice
  end

  def start_game
    @game.start_game
  end
end
