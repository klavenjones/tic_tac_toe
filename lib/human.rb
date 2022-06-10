# frozen_string_literal: true

require 'player'
require 'prompt'

class Human < Player
  attr_accessor :marker, :type, :prompt

  def initialize(marker = "X")
    super(marker, 'Human')
    @prompt = prompt
  end

  def get_move
    @prompt.get_players_move(@marker)
  end
end
