require "player"

describe Player do
  subject(:player) { Player.new("X", "Human") }

  describe "Human player marker and type" do
    it "should have the correct type for a player" do
      expect(player.type).to eq("Human")
    end

    it "should have the correct marker for a player" do
      expect(player.marker).to eq("X")
    end
  end
end
