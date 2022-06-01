# frozen_string_literal: true

require 'player'
require 'prompt'

class Human < Player
  attr_accessor :marker, :type

  def initialize(marker)
    super(marker, 'Human')
    @prompt = Prompt.new
  end

  def get_move
    @prompt.get_players_move(@marker)
  end
end
