# frozen_string_literal: true

class InputValidation
  def self.valid_number?(num)
    num.to_i.between?(1, 9)
  end

  
end
