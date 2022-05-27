# frozen_string_literal: true

require "prompt"
require "message"
require "board"

describe Prompt do
  let(:board) { Board.new }

  describe "Correct Terminal Output" do
    it "Should Print the welcome message" do
      expect { Prompt.welcome }.to output(Message.welcome).to_stdout
    end

    it "Should Print the tic tac toe board" do
      expect { Prompt.print_board }.to output(board.display_board).to_stdout
    end

    it "Should Print the instructions to the game" do
      expect { Prompt.print_instruction }.to output(
        Message.instruction
      ).to_stdout
    end

    it "Should print the current player" do
      marker = "X"
      expect { Prompt.print_current_player(marker) }.to output(
        Message.current_player(marker)
      ).to_stdout
    end

    it 'Should print the current player\'s recent move ' do
      marker = "X"
      expect { Prompt.print_players_move(marker, 9) }.to output(
        Message.players_move(marker, 9)
      ).to_stdout
    end

    it 'Should receive the current player\'s move ' do
      prompt = Prompt.new
      allow(prompt).to receive(:gets).and_return("9")
      expect(prompt.get_players_move("X")).to eq(9)
    end

    it "Should print any text supplied" do
      expect { Prompt.print_message("test") }.to output("test").to_stdout
    end
  end
end
