# frozen_string_literal: true

require 'player_builder'
require 'prompt'
require 'board'


describe Computer do
  before(:each) do
    @board = Board.new
    @prompt = Prompt.new(@board)
    builder = PlayerBuilder.new("Computer")
    builder.set_player_prompt(@prompt)
    builder.set_player_marker("O")
    @computer_player = builder.player
  end

  describe 'Computer marker and type' do
    it 'should have O marker for the Computer' do
      expect(@computer_player.marker).to eq('O')
    end

    it 'should have correct type for the Computer player' do
      expect(@computer_player.type).to eq('Computer')
    end
  end
end
