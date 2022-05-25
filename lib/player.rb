class Player
  attr_accessor :type, :marker

  def initialize(marker, type)
    @type = type
    @marker = marker
  end
end
