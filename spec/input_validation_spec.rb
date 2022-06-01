# frozen_string_literal: true

require 'input_validation'

describe InputValidation do
  describe '#is_valid_number?' do
    it 'should return false if the input is anything but a number.' do
      expect(InputValidation.is_valid_number?('O')).to eq(false)
    end

    it 'should return false if the input is less than 1.' do
      expect(InputValidation.is_valid_number?('-1')).to eq(false)
    end

    it 'should return true, if the input is within the range of 1-9' do
      expect(InputValidation.is_valid_number?('1')).to eq(true)
    end
  end
end
