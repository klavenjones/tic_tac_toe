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
      expect { Prompt.print_board }.to output(board.display_board).to_stdout
    end

    it 'Should Print the instructions to the game' do
      expect { Prompt.print_instruction }.to output(
        Message.instruction
      ).to_stdout
    end

    it 'Should print an error for when a player makes an invalid move.' do
      expect { Prompt.print_invalid_move_error }.to output(
        Message.invalid_move_error
      ).to_stdout
    end


    it 'Should print the current player' do
      marker = 'X'
      expect { Prompt.print_current_player(marker) }.to output(
        Message.current_player(marker)
      ).to_stdout
    end

    it 'Should print that the game ended in a tie' do
      expect { Prompt.print_tie }.to output(Message.tie).to_stdout
    end

    it 'Should print the winner of the game' do
      marker = 'X'
      expect { Prompt.print_winner(marker) }.to output(
        Message.winner(marker)
      ).to_stdout
    end

    it 'Should print the current player\'s recent move ' do
      marker = 'X'
      expect { Prompt.print_players_move(marker, 9) }.to output(
        "\nPlayer X chose the spot labeled: 9\n"
      ).to_stdout
    end

    it 'Should receive the current player\'s move ' do
      prompt = Prompt.new
      allow(prompt).to receive(:gets).and_return('9')
      expect(prompt.get_players_move('X')).to eq(9)
    end

    it 'Should print any text supplied' do
      expect { Prompt.print_message('test') }.to output('test').to_stdout
    end
  end
end
