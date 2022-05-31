# frozen_string_literal: true

require 'human'
require 'prompt'
require 'game'
require 'board'

class GameRunner
  def begin_session
    initialize_game
    start_game
  end

  def initialize_game
    Prompt.welcome
    Prompt.print_instruction
    @board = Board.new
    @player1 = Human.new('X')
    @player2 = Human.new('O')

    @game = Game.new(@board, @player1, @player2)
  end

  def start_game
    @game.start_game
  end
end
