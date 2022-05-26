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

  describe '#winner' do
    it 'should return the correct message when player X is the winner' do
      expect(Message.winner('X')).to eq('Player X is the winner.')
    end

    it 'should return the correct message when player O is the winner' do
      expect(Message.winner('O')).to eq('Player O is the winner.')
    end
  end

  describe '#tie' do
    it 'should return that the game ended in a tie' do
      expect(Message.tie).to eq('The game has ended in a tie.')
    end
  end

  describe '#exit' do
    it 'should return a farewell message' do
      expect(Message.exit).to eq('Thanks for playing Tic Tac Toe!')
    end
  end
end
