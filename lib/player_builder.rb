# frozen_string_literal: true

require 'human'
require 'computer'
require 'prompt'
require 'board'

class PlayerBuilder
  attr_accessor :player

  def initialize
    @player = Human.new
  end

  def set_player_marker(marker)
    @player.marker = marker
  end

  def set_player_prompt(prompt)
    @player.prompt = prompt
  end

  def build_player(prompt, marker, game_mode_choice = 1)
    @player = [2, 4].include?(game_mode_choice) ? Computer.new : Human.new
    set_player_prompt(prompt)
    set_player_marker(marker)
    @player
  end
end
