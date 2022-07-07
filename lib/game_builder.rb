# frozen_string_literal: true

require 'game'
require 'lite3_game'

class GameBuilder
  attr_accessor :game, :mode, :player1, :player2, :board, :prompt, :game_database_actions, :results_database_actions

  def initialize(mode)
    @mode = mode
  end

  def set_player_one(player1)
    @player1 = player1
  end

  def set_player_two(player2)
    @player2 = player2
  end

  def set_board(board)
    @board = board
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
    @game = @mode == 1 || @mode == 2 ? Game.new(@board, @prompt, @player1, @player2, @game_database_actions, @results_database_actions) : Lite3Game.new(@board, @prompt, @player1, @player2, @game_database_actions, @results_database_actions)
  end
end
