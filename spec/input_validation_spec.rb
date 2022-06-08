# frozen_string_literal: true

require 'input_validation'

describe InputValidation do
  describe '#valid_number?' do
    it 'should return false if the input is anything but a number.' do
      expect(InputValidation.valid_number?('O')).to eq(false)
    end

    it 'should return false if the input is less than 1.' do
      expect(InputValidation.valid_number?('-1')).to eq(false)
    end

    it 'should return true, if the input is within the range of 1-9' do
      expect(InputValidation.valid_number?('1')).to eq(true)
    end
  end

  describe '#single_char' do
    it 'should return true if the user inputs a character of length 1'do
      expect(InputValidation.single_char?("A")).to eq(true)
    end

    it 'should return false if the user inputs a character of a length greater than 1'do
      expect(InputValidation.single_char?("AA")).to eq(false)
    end

    it 'should return false if the user inputs a character of a length less than 1'do
      expect(InputValidation.single_char?("")).to eq(false)
    end
  end

  describe '#valid_marker' do
    it 'should return true if the user inputs a marker that is one character long and not a number'do
      expect(InputValidation.valid_marker?("A")).to eq(true)
    end

    it 'should return false if the user inputs a number for a marker'do
      expect(InputValidation.valid_marker?("1")).to eq(false)
    end

    it 'should return false if the user inputs a marker with the length of greater than 1'do
      expect(InputValidation.valid_marker?("AAA")).to eq(false)
    end

    it 'should return false if the user inputs no character'do
      expect(InputValidation.valid_marker?("")).to eq(false)
    end
  end

  describe '#marker_taken?' do
    it 'should return true if custom marker1 is equal to marker2' do
      expect(InputValidation.marker_taken?('A', 'A')).to eq(true)
    end

    it 'should return false if marker1 and marker2 aren\'t equal' do
      expect(InputValidation.marker_taken?('A', 'R')).to eq(false)
    end
  end


end
