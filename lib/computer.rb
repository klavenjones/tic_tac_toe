# frozen_string_literal: true

require 'player'
require 'prompt'

class Computer < Player
  attr_accessor :marker, :type, :prompt

  def initialize(marker = 'X')
    super(marker, 'Computer')
    @prompt = prompt
  end

  def get_move
    @prompt.get_computers_move(@marker)
  end
end
