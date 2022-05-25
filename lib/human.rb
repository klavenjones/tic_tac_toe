require "player"

class Human < Player
  attr_accessor :marker, :type
  
  def initialize(marker)
    @marker = marker
    @type = "Human"
  end
end
