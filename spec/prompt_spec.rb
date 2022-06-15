# frozen_string_literal: true

require 'prompt'
require 'message'
require 'board'

# rubocop:disable Metrics/BlockLength
describe Prompt do
  let(:board) { Board.new }
  subject(:prompt) { described_class.new(board) }

  describe '#welcome' do
    it 'should Print the welcome message' do
      expect { prompt.welcome }.to output(Message.welcome).to_stdout
    end
  end

  describe '#print_ask_for_custom_marker' do
    it 'should print the instruction to choose custom marker message' do
      expect { prompt.print_ask_for_custom_marker }.to output(Message.ask_for_custom_marker).to_stdout
    end
  end

  describe '#print_player_custom_marker' do
    it 'should print the prompt message for player 1 to choose a custom marker' do
      expect { prompt.print_player_custom_marker(1) }.to output(Message.player_custom_marker(1)).to_stdout
    end

    it 'should print the prompt message for player 2 to choose a custom marker' do
      expect { prompt.print_player_custom_marker(2) }.to output(Message.player_custom_marker(2)).to_stdout
    end
  end

  describe '#print_player_custom_marker_choice' do
    it 'should print the choice the player made after choosing a marker' do
      player = 1
      marker = 'R'
      expect { prompt.print_player_custom_marker_choice(player, marker) }.to output(Message.player_custom_marker_choice(player, marker)).to_stdout
    end
  end

  describe '#print_board' do
    it 'should Print the tic tac toe board' do
      expect { prompt.print_board }.to output(Message.display_board(board.board_grid)).to_stdout
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

  describe '#print_invalid_marker_error' do
    it 'should print an error for when a player chooses an invalid marker' do
      expect { prompt.print_invalid_marker_error }.to output(
        Message.invalid_marker_error
      ).to_stdout
    end
  end

  describe '#print_duplicate_marker_error' do
    it 'should print an error for when a player chooses a duplicate marker' do
      expect { prompt.print_duplicate_marker_error }.to output(
        Message.duplicate_marker_error
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
    it 'should print the player\'s recent move' do
      marker = 'X'
      expect { prompt.print_players_move(marker, 9) }.to output(
        Message.players_move(marker, 9)
      ).to_stdout
    end
  end

  describe '#print_game_mode_prompt' do
    it 'Should print a message that asks the user to choose a game mode' do
      expect { prompt.print_game_mode_prompt }.to output(
        Message.game_mode_prompt
      ).to_stdout
    end
  end

  describe '#print_player_game_mode_choice' do
    it 'Should print a message that prints the game mode choice' do
      expect { prompt.print_player_game_mode_choice(1) }.to output(
        Message.player_game_mode_choice(1)
      ).to_stdout
    end
  end

  describe '#print_invalid_game_mode_error' do
    it 'Should print a message that prints an error message for invalid game mode choice' do
      expect { prompt.print_invalid_game_mode_error }.to output(
        Message.invalid_game_mode_error
      ).to_stdout
    end
  end

  describe '#print_game_mode_prompt' do
    it 'Should print a message that asks the user to choose a game mode' do
      expect { prompt.print_game_mode_prompt }.to output(
        Message.game_mode_prompt
      ).to_stdout
    end
  end

  describe '#get_custom_marker' do
    it 'should receive and return player\'s custom marker choice' do
      allow(prompt).to receive(:gets).and_return('a')
      expect(prompt.get_custom_marker).to eq('A')
    end
  end

  describe '#get_players_move' do
    it 'should receive the player\'s move ' do
      allow(prompt).to receive(:gets).and_return('9')
      expect(prompt.get_players_move('X')).to eq(9)
    end
  end

  describe '#get_game_mode' do
    it 'should receive the player\'s game mode choice' do
      allow(prompt).to receive(:gets).and_return('1')
      expect(prompt.get_game_mode).to eq(1)
    end
  end

  describe '#get_computers_move' do
    it 'should receive the computer player\'s move ' do
      board.board_grid = %w[X 2 3 4 5 6 7 8 9]
      expect(prompt.get_computers_move('X')).to eq(2)
    end
  end
end
# rubocop:enable Metrics/BlockLength
