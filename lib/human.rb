# frozen_string_literal: true

require 'player'

class Human < Player
  attr_accessor :marker, :type

  def initialize
    super
    @marker = marker
    @type = 'Human'
  end
end
