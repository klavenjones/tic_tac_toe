# frozen_string_literal: true

require 'prompt'
require 'message'
require 'board'

describe Prompt do
  let(:board) { Board.new }
  subject(:prompt) {described_class.new(board)}

  describe '#welcome' do
    it 'should Print the welcome message' do
      expect { prompt.welcome }.to output(Message.welcome).to_stdout
    end
  end

  describe '#print_board' do
    it 'should Print the tic tac toe board' do
      expect { prompt.print_board }.to output(board.display_board).to_stdout
    end
  end

  describe '#print_instruction' do
    it 'should Print the instructions to the game' do
      expect { prompt.print_instruction }.to output(
        Message.instruction
      ).to_stdout
    end
  end

  describe '#print_invalid_move_error' do
    it 'should print an error for when a player makes an invalid move.' do
      expect { prompt.print_invalid_move_error }.to output(
        Message.invalid_move_error
      ).to_stdout
    end
  end

  describe '#print_current_player' do
    it 'should print the current player' do
      marker = 'X'
      expect { prompt.print_current_player(marker) }.to output(
        Message.current_player(marker)
      ).to_stdout
    end
  end

  describe '#print_tie' do
    it 'should print that the game ended in a tie' do
      expect { prompt.print_tie }.to output(Message.tie).to_stdout
    end
  end
  describe '#print_winner' do
    it 'should print the winner of the game' do
      marker = 'X'
      expect { prompt.print_winner(marker) }.to output(
        Message.winner(marker)
      ).to_stdout
    end
  end

  describe '#print_players_move' do
    it 'should print the current player\'s recent move' do
      marker = 'X'
      expect { prompt.print_players_move(marker, 9) }.to output(
        "\nPlayer X chose the spot labeled: 9\n"
      ).to_stdout
    end
  end

  describe '#get_players_move' do
    it 'should receive the current player\'s move ' do
      allow(prompt).to receive(:gets).and_return('9')
      expect(prompt.get_players_move('X')).to eq(9)
    end
  end

  describe '#get_computers_move' do
    it 'should receive the current player\'s move ' do
      board.board_grid = %w[X 2 3 4 5 6 7 8 9]
      expect(prompt.get_computers_move('X')).to eq(2)
    end
  end

 

  describe '#print_message' do
    it 'should print any text supplied' do
      expect { prompt.print_message('test') }.to output('test').to_stdout
    end
  end
end
