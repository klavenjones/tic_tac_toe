require "board"

describe Board do
  describe "#display_board" do
    it "should return the board" do
      expect(Board.display_board).to eq(
        "\n 1 | 2 | 3 \n---|---|---\n 4 | 5 | 6  \n---|---|---\n 7 | 8 | 9 \n\n\n"
      )
    end
  end
end
