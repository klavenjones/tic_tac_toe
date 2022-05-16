# frozen_string_literal: true

require 'tic_tac_toe'

describe TicTacToe do
  describe '#hello' do
    it 'should return HELLO' do
      tic_tac_toe = TicTacToe.new
      output = tic_tac_toe.hello
      expect(output).to eq('Welcome to Tic-Tac-Toe')
    end
  end
end
