# frozen_string_literal: true

require 'game'
require 'board'
require 'prompt'
require 'player_builder'
require 'lite3_board'

class GameBuilder
  attr_accessor :game, :mode, :players, :board, :prompt, :database_actions

  def initialize(mode)
    @mode = mode
    @player1_builder = PlayerBuilder.new
    @player2_builder = PlayerBuilder.new
  end

  def set_players(markers)
    @players = [
      @player1_builder.build_player(@prompt, markers[0], @mode),
      @player2_builder.build_player(@prompt, markers[1])
    ]
  end

  def set_board
    @board = @mode == 1 || @mode == 2 ? Board.new : Lite3Board.new
  end

  def set_prompt
    @prompt = Prompt.new(@board)
  end

  def set_database_actions(database_actions)
    @database_actions = database_actions
  end

  def set_game
    @game =
      Game.new(
        board: @board,
        prompt: @prompt,
        players: @players,
        database_actions: @database_actions
      )
  end

  def build_game(markers, database_actions = DatabaseActions.new('tic_tac_toe.db'))
    set_board
    set_prompt
    set_players(markers)
    set_database_actions(database_actions)
    set_game
    @game
  end
end
