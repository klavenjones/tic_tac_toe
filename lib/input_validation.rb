# frozen_string_literal: true

class InputValidation
  VALID_MARKER_LENGTH = 1

  def self.valid_number?(num)
    num.to_i.between?(1, 9)
  end

  def self.single_char?(marker)
    marker.length == VALID_MARKER_LENGTH
  end

  def self.valid_marker?(marker)
    single_char?(marker) && !valid_number?(marker)
  end

  def self.marker_taken?(marker1, marker2)
    marker1 == marker2
  end
end
