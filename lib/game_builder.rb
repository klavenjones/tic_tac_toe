# frozen_string_literal: true

require 'game'
require 'board'
require 'lite3_board'

class GameBuilder
  attr_accessor :game,
                :mode,
                :player1,
                :player2,
                :board,
                :prompt,
                :game_database_actions,
                :results_database_actions

  def initialize(mode)
    @mode = mode
  end

  def set_player_one(player1)
    @player1 = player1
  end

  def set_player_two(player2)
    @player2 = player2
  end

  def set_board
    @board = @mode == 1 || @mode == 2 ? Board.new : Lite3Board.new
  end

  def set_prompt(prompt)
    @prompt = prompt
  end

  def set_game_database_actions(game_database_actions)
    @game_database_actions = game_database_actions
  end

  def set_results_database_actions(results_database_actions)
    @results_database_actions = results_database_actions
  end

  def set_game
    @game = Game.new(
      board: @board,
      prompt: @prompt,
      player1: @player1,
      player2: @player2,
      game_database_actions: @game_database_actions,
      results_database_actions: @results_database_actions
    )
  end
end
