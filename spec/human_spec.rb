require "human"

describe Human do
  subject(:human_player) { Human.new("O") }

  describe "human marker and type" do
    it "should have O marker for the human" do
      expect(human_player.marker).to eq("O")
    end

    it "should have correct type for the human player" do
      expect(human_player.type).to eq("Human")
    end
  end
end
