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

end
