# frozen_string_literal: true

require 'human'
require 'computer'
require 'prompt'
require 'board'

class PlayerBuilder
  attr_accessor :player

  def initialize(type = 'Human')
    @player = if type == 'Computer'
                Computer.new
              else
                Human.new
              end
  end

  def set_player_marker(marker)
    @player.marker = marker
  end

  def set_player_prompt(prompt)
    @player.prompt = prompt
  end
end
