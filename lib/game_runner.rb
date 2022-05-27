# frozen_string_literal: true

require 'prompt'

class GameRunner
  def begin_session
    initialize_game
  end

  def initialize_game
    Prompt.welcome
    Prompt.print_instruction
    Prompt.print_board
    # @player_1 = Human.new("X")
    # @player_2 = Human.new("O")
  end
end