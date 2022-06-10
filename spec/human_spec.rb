# frozen_string_literal: true
require 'player_builder'
require 'prompt'
require 'board'

describe Human do
  before(:each) do
    @board = Board.new
    @prompt = Prompt.new(@board)
    builder = PlayerBuilder.new
    builder.set_player_prompt(@prompt)
    builder.set_player_marker("O")
    @human_player = builder.player
  end

  describe 'human marker and type' do
    it 'should have O marker for the human' do
      expect(@human_player.marker).to eq('O')
    end

    it 'should have correct type for the human player' do
      expect(@human_player.type).to eq('Human')
    end
  end
end
