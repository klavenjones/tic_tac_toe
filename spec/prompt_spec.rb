# frozen_string_literal: true

require 'prompt'
require 'message'
require 'board'

describe Prompt do
  let(:board) { Board.new }

  describe 'Correct Terminal Output' do
    it 'Should Print the welcome message' do
      expect { Prompt.welcome }.to output(Message.welcome).to_stdout
    end

    it 'Should Print the tic tac toe board' do
      expect { Prompt.print_board }.to output(Board.display_board).to_stdout
    end

    it 'Should Print the instructions to the game' do
      expect { Prompt.print_instruction }.to output(
        Message.instruction
      ).to_stdout
    end

    it 'Should print any text supplied' do
      expect { Prompt.print_message('test') }.to output('test').to_stdout
    end
  end
end
