# frozen_string_literal: true
require 'player_builder'
require 'prompt'
require 'game'
require 'board'
require 'custom_marker'

class GameRunner
  def begin_session
    initialize_game
    start_game
  end

  def initialize_game
    @board = Board.new
    @prompt = Prompt.new(@board)
    
    @player1 = PlayerBuilder.new
    @player1.set_player_prompt(prompt)
    @builder.set_player_marker("X")
   
    @player2 = PlayerBuilder.new
    @player2.set_player_prompt(prompt)
    @player2.set_player_marker("O")
      
   

    @game = Game.new(@board, @prompt, @player1, @player2)
  end

  def start_game
    @game.start_game
  end
end
