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
    it 'should return true if the user inputs a character of length 1' do
      expect(InputValidation.single_char?('A')).to eq(true)
    end

    it 'should return false if the user inputs a character of a length greater than 1' do
      expect(InputValidation.single_char?('AA')).to eq(false)
    end

    it 'should return false if the user inputs a character of a length less than 1' do
      expect(InputValidation.single_char?('')).to eq(false)
    end
  end

  describe '#valid_marker' do
    it 'should return true if the user inputs a marker that is one character long and not a number' do
      expect(InputValidation.valid_marker?('A')).to eq(true)
    end

    it 'should return false if the user inputs a number for a marker' do
      expect(InputValidation.valid_marker?('1')).to eq(false)
    end

    it 'should return false if the user inputs a marker with the length of greater than 1' do
      expect(InputValidation.valid_marker?('AAA')).to eq(false)
    end

    it 'should return false if the user inputs no character' do
      expect(InputValidation.valid_marker?('')).to eq(false)
    end
  end

  describe '#marker_taken?' do
    it 'should return true if player 1 custom marker is the same as player 2 custom marker2
  ' do
      expect(InputValidation.marker_taken?('A', 'A')).to eq(true)
    end

    it 'should return false if marker1 and marker2 aren\'t equal' do
      expect(InputValidation.marker_taken?('A', 'R')).to eq(false)
    end
  end

  describe '#valid_game_mode?' do
    it 'should return false when the game mode choice is not 1 or 2' do
      expect(InputValidation.valid_game_choice?('A')).to eq(false)
      expect(InputValidation.valid_game_choice?(6)).to eq(false)
      expect(InputValidation.valid_game_choice?('YES')).to eq(false)
    end

    it 'should return true when the game mode choice is either 1, 2, 3, or 4' do
      expect(InputValidation.valid_game_choice?(1)).to eq(true)
      expect(InputValidation.valid_game_choice?(2)).to eq(true)
      expect(InputValidation.valid_game_choice?(3)).to eq(true)
      expect(InputValidation.valid_game_choice?(4)).to eq(true)
    end
  end

  describe '#valid_revist_choice?' do
    it 'should return false when the revisit choice is not 1 or 2' do
      expect(InputValidation.valid_revisit_choice?('A')).to eq(false)
      expect(InputValidation.valid_revisit_choice?(55)).to eq(false)
      expect(InputValidation.valid_revisit_choice?('YES')).to eq(false)
    end

    it 'should return true when the revisit choice is 1 or 2' do
      expect(InputValidation.valid_revisit_choice?(1)).to eq(true)
      expect(InputValidation.valid_revisit_choice?(2)).to eq(true)
      expect(InputValidation.valid_revisit_choice?(3)).to eq(true)
    end
  end

  describe '#valid_save_choice?' do
    it 'should return false when the save game choice is not Y or N' do
      expect(InputValidation.valid_save_choice?('A')).to eq(false)
      expect(InputValidation.valid_save_choice?(3)).to eq(false)
      expect(InputValidation.valid_save_choice?('')).to eq(false)
    end

    it 'should return true when the save game choice is Y or N' do
      expect(InputValidation.valid_save_choice?('Y')).to eq(true)
      expect(InputValidation.valid_save_choice?('N')).to eq(true)
    end
  end

  describe '#valid_in_game_save_choice?' do
    it 'should return false when the user selects anything outside S (save) and or numbers 1-9' do
      expect(InputValidation.valid_in_game_save_choice?('R')).to eq(false)
      expect(InputValidation.valid_in_game_save_choice?(0)).to eq(false)
      expect(InputValidation.valid_in_game_save_choice?('Y')).to eq(false)
    end

    it 'should return true when the user selects proper input. Which is S' do
      expect(InputValidation.valid_in_game_save_choice?('S')).to eq(true)
      expect(InputValidation.valid_in_game_save_choice?('s')).to eq(true)
    end
  end
end
