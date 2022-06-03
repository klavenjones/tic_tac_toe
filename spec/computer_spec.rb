# frozen_string_literal: true

require 'computer'
require 'prompt'
require 'board'

describe Computer do
  let(:board) { Board.new }
  let(:prompt) { Prompt.new(board) }
  subject(:computer_player) { Computer.new('O', prompt) }

  describe 'Computer marker and type' do
    it 'should have O marker for the Computer' do
      expect(computer_player.marker).to eq('O')
    end

    it 'should have correct type for the Computer player' do
      expect(computer_player.type).to eq('Computer')
    end
  end
end
