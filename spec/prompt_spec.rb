# frozen_string_literal: true

require 'prompt'
require 'message'
require 'board'
require 'lite3_board'

# rubocop:disable Metrics/BlockLength
describe Prompt do
  let(:board) { Board.new }
  subject(:prompt) { described_class.new(board) }

  describe '#welcome' do
    it 'should Print the welcome message' do
      expect { prompt.welcome }.to output(Message.welcome).to_stdout
    end
  end

  describe '#print_message' do
    it 'should print the incoming message' do
      expect { prompt.print_message('test') }.to output('test').to_stdout
    end
  end

  describe '#print_save_game_success' do
    it 'should print a message telling the user they saved the game' do
      expect { prompt.print_save_game_success }.to output(Message.save_game_success).to_stdout
    end
  end

  describe '#print_save_game_declined' do
    it 'should print a message telling the user they declined to save the game' do
      expect { prompt.print_save_game_declined }.to output(Message.save_game_declined).to_stdout
    end
  end

  describe '#print_show_results_message' do
    it 'should return a message when a user elects to show results of past games' do
      expect { prompt.print_show_results_message }.to output(Message.show_results_message).to_stdout
    end
  end

  describe '#print_show_games_message' do
    it 'should return a message when a user elects to play an existing game' do
      expect { prompt.print_show_games_message }.to output(Message.show_games_message).to_stdout
    end
  end

  describe '#print_ask_for_custom_marker' do
    it 'should print the instruction to choose custom marker message' do
      expect { prompt.print_ask_for_custom_marker }.to output(Message.ask_for_custom_marker).to_stdout
    end
  end

  describe '#print_ask_to_revisit_game' do
    it 'should print instructions for a player to choose between starting a new game,viewing results, and playing an existing game' do
      expect { prompt.print_ask_to_revisit_game }.to output(Message.ask_to_revisit_game).to_stdout
    end
  end

  describe '#print_ask_to_save_game' do
    it 'should print the instruction to choose custom marker message' do
      expect { prompt.print_ask_to_save_game }.to output(Message.ask_to_save_game).to_stdout
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

  describe '#print_lite3_board' do
    before(:all) do
      @board = Lite3Board.new
      @prompt = Prompt.new(@board)
    end
    it 'should Print the tic tac toe board' do
      expect { @prompt.print_lite3_board }.to output(Message.display_lite3_board(@board.board_grid)).to_stdout
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

  describe '#print_invalid_save_game_error' do
    it 'Should print a message that prints an error message for invalid save game choice' do
      expect { prompt.print_invalid_save_game_error }.to output(
        Message.invalid_save_game_error
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
      expect(prompt.get_players_move('X')).to eq('9')
    end
  end

  describe '#get_game_mode' do
    it 'should receive the player\'s game mode choice' do
      allow(prompt).to receive(:gets).and_return('1')
      expect(prompt.get_game_mode).to eq(1)
    end
  end

  describe '#get_revisit_game_choice' do
    it 'should receive the player\'s choice of option 1. when asked it theyd like to revist a game, start a new game or review game results' do
      allow(prompt).to receive(:gets).and_return('1')
      expect(prompt.get_revisit_game_choice).to eq(1)
    end

    it 'should receive the player\'s choice of option 1. when asked it theyd like to revist a game, start a new game or review game results' do
      allow(prompt).to receive(:gets).and_return('2')
      expect(prompt.get_revisit_game_choice).to eq(2)
    end
  end

  describe '#get_save_game_choice' do
    it 'should receive the player\'s save game choice if Yes' do
      allow(prompt).to receive(:gets).and_return('Y')
      expect(prompt.get_save_game_choice).to eq('Y')
    end

    it 'should receive the player\'s save game choice if Yes' do
      allow(prompt).to receive(:gets).and_return('y')
      expect(prompt.get_save_game_choice).to eq('Y')
    end

    it 'should receive the player\'s save game choice if No' do
      allow(prompt).to receive(:gets).and_return('N')
      expect(prompt.get_save_game_choice).to eq('N')
    end

    it 'should receive the player\'s save game choice if No' do
      allow(prompt).to receive(:gets).and_return('n')
      expect(prompt.get_save_game_choice).to eq('N')
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
