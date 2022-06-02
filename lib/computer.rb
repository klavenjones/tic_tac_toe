require 'player'
require 'prompt'

class Computer < Player
  attr_accessor :marker, :type

  def initialize(marker)
    super(marker, 'Computer')
    @prompt = Prompt.new
  end

  def get_move
    @prompt.get_computers_move(@marker)
  end
end
