# frozen_string_literal: true

require 'message'

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

  describe '#exit' do
    it 'should return a farewell message' do
      expect(Message.exit).to eq('Thanks for playing Tic Tac Toe!')
    end
  end
end
