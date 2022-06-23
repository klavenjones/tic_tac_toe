# frozen_string_literal: true

require 'message'
# rubocop:disable Metrics/BlockLength
describe Message do
  describe '#welcome' do
    it 'should return the correct welcome message' do
      expect(Message.welcome).to eq(Message.welcome)
    end
  end

  describe '#instruction' do
    it 'should return instructions to make a move' do
      expect(Message.instruction).to eq(
        "\n\nPlease pick a spot by pressing one number in the range of 1-9\n\n"
      )
    end
  end

  describe '#ask_for_custom_marker' do
    it 'should return instructions for a player to choose a custom marker' do
      expect(Message.ask_for_custom_marker).to eq("\n\nPlease choose a custom marker to identify yourself on the board. ex. A, B, C\n\n")
    end
  end

  describe '#save_game_success' do
    it 'should return results if a user elects to save the game' do
      expect(Message.save_game_success).to eq("\n\nYou have successfully saved the game. Bye Bye!\n")
    end
  end

  describe '#save_game_declined' do
    it 'should return results if a user elects to not save the game' do
      expect(Message.save_game_declined).to eq("\n\nYou have chosen not to save the game. Bye Bye!\n")
    end
  end

  describe '#player_custom_marker' do
    it 'should return a prompt for the current player to make a choice for their custom marker' do
      expect(Message.player_custom_marker(1)).to eq("\n\nPlayer 1: please choose your custom marker.\n\n")
    end
  end

  describe '#player_custom_marker_choice' do
    it 'should return the choice of the custom marker from a player' do
      expect(Message.player_custom_marker_choice(1, 'A')).to eq("\n\nPlayer 1 your marker choice is: A.\n\n")
    end
  end

  describe '#player_game_mode_choice' do
    it 'should return the game mode choice if Computer vs Human was selected' do
      expect(Message.player_game_mode_choice(2)).to eq("\n\nYou have chosen play game mode 2: Computer vs. Human.\n\n")
    end
    it 'should return the game mode choice if Human vs Human was selected' do
      expect(Message.player_game_mode_choice(1)).to eq("\n\nYou have chosen play game mode 1: Human vs. Human.\n\n")
    end
  end

  describe '#ask_to_save_game' do
    it 'should return a prompt asking a user if they want to save the result of the game' do
      expect(Message.ask_to_save_game).to eq("\nWould you like to save the result of the game?\nPress Y for Yes\nPress N for No\n")
    end
  end

  describe '#current_player' do
    it 'should return a prompt to the current player' do
      expect(Message.current_player('X')).to eq(
        "\nPlayer X it's your turn to make a move."
      )
    end
  end

  describe '#players_move' do
    it 'should return the player\'s move' do
      expect(Message.players_move('X', 9)).to eq(
        "\nPlayer X chose the spot labeled: 9\n"
      )
    end
  end

  describe '#players_move' do
    it 'should return the computer\'s move' do
      expect(Message.computers_move('X', 9)).to eq(
        "\nComputer player X chose the spot labeled: 9\n"
      )
    end
  end

  describe '#invalid_move_error' do
    it 'should return an error message when a player enters the wrong number' do
      expect(Message.invalid_move_error).to eq(
        "\nThat was an invalid move, please enter a number in the range of 1-9\n"
      )
    end
  end

  describe '#invalid_marker_error' do
    it 'should return an error message when a player enters the marker' do
      expect(Message.invalid_marker_error).to eq(
        "\nThat is an invalid marker, please enter any letter from A to Z\n"
      )
    end
  end

  describe '#invalid_game_mode_error' do
    it 'should return an error message when a player enters the wrong input for game mode' do
      expect(Message.invalid_game_mode_error).to eq(
        "\nInvalid game mode choice, please pick either game mode 1 or 2: \n1. Human Vs Human\n2. Computer vs Human\n"
      )
    end
  end

  describe '#invalid_save_game_error' do
    it 'should return an error message when a player enters the wrong input for saving the game' do
      expect(Message.invalid_save_game_error).to eq(
        "\nInvalid save game choice, please type either: \nY for Yes \nN for No\n"
      )
    end
  end

  describe '#duplicate_marker_error' do
    it 'should return an error message when a player 2 enters the same marker as player 1' do
      expect(Message.duplicate_marker_error).to eq(
        "\nPlayer one has chosen this marker already. Please select a marker that is unique.\n"
      )
    end
  end

  describe '#winner' do
    it 'should return the correct message when player X is the winner' do
      expect(Message.winner('X')).to eq("\n\nPlayer X is the winner.\n\n")
    end

    it 'should return the correct message when player O is the winner' do
      expect(Message.winner('O')).to eq("\n\nPlayer O is the winner.\n\n")
    end
  end

  describe '#tie' do
    it 'should return that the game ended in a tie' do
      expect(Message.tie).to eq("\n\nThe game has ended in a tie.\n\n")
    end
  end

  describe '#game_mode_prompt' do
    it 'should return a message that asks the user to choose a game mode' do
      expect(Message.game_mode_prompt).to eq("\n\nPlease select the game mode you would like to play (Select 1 or 2): \n1. Human vs. Human\n2. Computer vs. Human\n\n")
    end
  end

  describe '#exit' do
    it 'should return a farewell message' do
      expect(Message.exit).to eq('Thanks for playing Tic Tac Toe!')
    end
  end
end
# rubocop:enable Metrics/BlockLength
