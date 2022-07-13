# frozen_string_literal: true

require 'board'
require 'prompt'

describe Board do
  before(:each) do
    @board = Board.new
    @prompt = Prompt.new(@board)
  end

  describe '#mark_board' do
    it 'should verify that the player marked position number one (Top left corner)' do
      @board.mark_board('X', 1)
      expect { @prompt.print_board }.to output(
        "\n X | 2 | 3 \n---|---|---\n 4 | 5 | 6  \n---|---|---\n 7 | 8 | 9 \n\n\n"
      ).to_stdout
    end

    it 'should verify that the player marked position number nine (Bottom right corner)' do
      @board.mark_board('X', 9)
      expect { @prompt.print_board }.to output(
        "\n 1 | 2 | 3 \n---|---|---\n 4 | 5 | 6  \n---|---|---\n 7 | 8 | X \n\n\n"
      ).to_stdout
    end
  end

  describe '#taken_spaces' do
    it 'should return the amount if only one space is taken' do
      @board.mark_board('X', 1)
      expect(@board.taken_spaces).to eq(1)
    end

    it 'should return the amount if 3 spaces were spaces taken' do
      @board.mark_board('X', 1)
      @board.mark_board('X', 9)
      @board.mark_board('X', 2)
      expect(@board.taken_spaces).to eq(3)
    end
  end

  describe '#full?' do
    it 'should display true when the board is full' do
      @board.board_grid.each_with_index do |_item, index|
        @board.mark_board('X', index)
      end
      expect(@board.full?).to eq(true)
    end

    it 'should display false when the board is not full' do
      expect(@board.full?).to eq(false)
    end
  end

  describe '#winner?' do
    it 'should display true if there is a winner' do
      (1..3).each do |i|
        @board.mark_board('X', i)
      end
      expect(@board.winner?).to eq(true)
    end
  end

  describe '#spot_taken?' do
    it 'should return true if the space is taken' do
      @board.mark_board('X', 1)
      expect(@board.spot_taken?(1)).to eq(true)
    end

    it 'should return false if the space is available' do
      expect(@board.spot_taken?(1)).to eq(false)
    end
  end

  describe '#spaces_available' do
    it 'should return an array with only 8 available spaces.' do
      @board.mark_board('X', 1)
      print @board.spaces_available[0].marker
      expect(@board.spaces_available.length).to eq(8)
    end

    it 'should return an empty array when there are no spots left' do
      (1..9).each { |space| @board.mark_board('X', space) }
      expect(@board.spaces_available).to eq([])
    end
  end

  describe '#build_board' do
    it 'should build board and return an array' do
      expect(@board.build_board).to be_a(Array)
    end

    it 'should build board and an element should return an instance of a Space' do
      space = @board.build_board[0]
      expect(space).to be_instance_of(Space)
    end

    it 'should mark the board and return the marker of X' do
      @board.mark_board('X', 1)
      space = @board.board_grid[0]
      expect(space.marker).to eq('X')
    end
  end
end
