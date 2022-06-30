# frozen_string_literal: true

class InputValidation
  VALID_MARKER_LENGTH = 1
  VALID_GAME_MODES = [1, 2].freeze
  VALID_REVIST_CHOICES = [1, 2, 3].freeze
  VALID_SAVE_CHOICE = %w[Y N].freeze
  VALID_IN_GAME_SAVE_CHOICE = %w[S s].freeze

  def self.valid_game_choice?(choice)
    VALID_GAME_MODES.include?(choice)
  end

  def self.valid_revisit_choice?(choice)
    VALID_REVIST_CHOICES.include?(choice)
  end

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

  def self.valid_in_game_save_choice?(choice)
    VALID_IN_GAME_SAVE_CHOICE.include?(choice)
  end

  def self.valid_save_choice?(choice)
    VALID_SAVE_CHOICE.include?(choice)
  end
end
