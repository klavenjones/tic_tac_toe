# frozen_string_literal: true

require 'human'
require 'prompt'
require 'board'

describe Human do
  let(:board) {Board.new}
  let(:prompt) {Prompt.new(board)}  
  subject(:human_player) { Human.new('O', board) }


  describe 'human marker and type' do
    it 'should have O marker for the human' do
      expect(human_player.marker).to eq('O')
    end

    it 'should have correct type for the human player' do
      expect(human_player.type).to eq('Human')
    end
  end
end
