require "prompt"

class GameRunner
  attr_accessor :prompt, :player_1, :player_2, :board

  def begin_session
    initialize_game
  end

  def initialize_game
    Prompt.welcome
    Prompt.print_instruction
    Prompt.print_board
    #prompt.print_message(@board)
    #@player_1 = Human.new("X")
    #@player_2 = Human.new("O")
  end
end
