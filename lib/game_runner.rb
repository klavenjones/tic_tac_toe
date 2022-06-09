# frozen_string_literal: true

require 'human'
require 'computer'
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
    @player1 = Human.new('X', @prompt)
    @player2 = Human.new('O', @prompt)

    @prompt.welcome
    @prompt.print_instruction

    @custom_marker = CustomMarker.new(@prompt, @player1, @player2)
    @custom_marker.choose_custom_marker


    @game = Game.new(@board, @prompt, @player1, @player2)
  end

  def start_game
    @game.start_game
  end
end
