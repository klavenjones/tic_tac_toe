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

    @player1 = build_player(@prompt, 'X')
    @player2 = build_player(@prompt, 'O')

    @game = Game.new(@board, @prompt, @player1, @player2)
  end

  def build_player(prompt, marker)
    builder = PlayerBuilder.new
    builder.set_player_prompt(prompt)
    builder.set_player_marker(marker)
    builder.player
  end

  def start_game
    @game.start_game
  end
end
