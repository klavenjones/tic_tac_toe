require "message"

describe Message do
  describe "#welcome" do
    it "should return the correct welcome message" do
      message = Message.new
      output = message.welcome
      expect(output).to eq(
        "-----------------------------------------------------\nWelcome To Tic Tac Toe\n-----------------------------------------------------"
      )
    end
  end

  describe "#winner" do
    it "should return the correct message when player X is the winner" do
      message = Message.new
      output = message.winner("X")
      expect(output).to eq("Player X is the winner.")
    end

    it "should return the correct message when player O is the winner" do
      message = Message.new
      output = message.winner("O")
      expect(output).to eq("Player O is the winner.")
    end
  end

  describe "#tie" do
    it "should return that the game ended in a tie" do
      message = Message.new
      output = message.tie
      expect(output).to eq("The game has ended in a tie.")
    end
  end

  describe "#instruction" do
    it "should return instructions to make a move" do
      message = Message.new
      output = message.instruction
      expect(output).to eq(
        "Please pick a spot by pressing one number in the range of 1-9"
      )
    end
  end
end
