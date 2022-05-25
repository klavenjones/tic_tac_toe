# frozen_string_literal: true

require 'tic_tac_toe'
require 'message'

describe TicTacToe do
  describe '#hello' do
    it 'should return HELLO' do
      tic_tac_toe = TicTacToe.new
      expect { tic_tac_toe }.to output(message.welcome).to_stdout
    end
  end
end
