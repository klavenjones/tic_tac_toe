# frozen_string_literal: true

require 'player'

class Human < Player
  attr_accessor :marker, :type

  def initialize(marker)
    super(marker, 'Human')
  end
end
