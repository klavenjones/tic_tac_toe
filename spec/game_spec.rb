# frozen_string_literal: true

require 'game'
require 'player_builder'
require 'board'
require 'prompt'
require 'message'

describe Game do

  before(:each) do
    @board = Board.new
    @prompt = Prompt.new(@board)

    @player1 = build_player(@prompt, 'X')
    @player2 = build_player(@prompt, 'O')

    @game = Game.new(@board, @prompt, @player1, @player2)
  end

  describe '#start_game' do
    it 'should display tic tac toe board' do
      expect { @prompt.print_board }.to output(
        Message.display_board(@board.board_grid)
      ).to_stdout
    end
  end

  describe '#set_current_player' do
    it 'should set current player to player and return marker O' do
      @game.set_current_player(@game.player2)
      expect(@game.current_player.marker).to eq('O')
    end
  end

  describe '#set_winning_player' do
    it 'should set player to winning player and return marker O' do
      @game.set_winning_player(@game.player2)
      expect(@game.winning_player.marker).to eq('O')
    end
  end

  describe '#update_current_player' do
    it 'should update the current player correctly' do
      expect(@game.current_player.marker).to eq('X')
      @game.update_current_player
      expect(@game.current_player.marker).to eq('O')
    end
  end

  describe '#status' do
    it 'should print a message when there is a tie' do
      @board.board_grid = %w[O O X X X O O O X]
      expect { @game.status }.to output("\n\nThe game has ended in a tie.\n\n").to_stdout
    end

    it 'should print a message when there is a winner' do
      @board.board_grid = %w[X X X O 4 5 O O]
      expect { @game.status }.to output("\n\nPlayer X is the winner.\n\n").to_stdout
    end
  end

  describe '#game_over?' do
    it 'should return false if the game is not over' do
      expect(@game.game_over?).to eq(false)
    end

    it 'should return true when the board is full' do
      @board.board_grid = %w[X O X X O X O O X]
      expect(@game.game_over?).to eq(true)
    end

    it 'should return true when a player has won' do
      @board.board_grid = %w[X X X O 5 6 O 8 9]
      expect(@game.game_over?).to eq(true)
    end
  end

  
end

# Utility Method
def build_player(prompt, marker)
  builder = PlayerBuilder.new
  builder.set_player_prompt(prompt)
  builder.set_player_marker(marker)
  builder.player
end