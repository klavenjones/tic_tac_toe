# frozen_string_literal: true

require 'game'
require 'human'
require 'board'
require 'prompt'

describe Game do
  let(:player1) { Human.new('X') }
  let(:player2) { Human.new('O') }
  let(:board) { Board.new }
  subject(:game) { Game.new(board, player1, player2) }

  describe '#determine_winner' do
    it 'should determine winner based on the amount of markers on board' do
      board.board_grid = %w[O O O X O X O O X]
      expect(game.determine_winner).to eq('O')
    end
  end

  describe '#start_game' do
    it 'should display tic tac toe board' do
      expect { Prompt.print_board }.to output(board.display_board).to_stdout
    end
  end

  describe '#set_current_player' do
    it 'should set current player to player and return marker O' do
      game.set_current_player(game.player2)
      expect(game.current_player.marker).to eq('O')
    end
  end

  describe '#update_current_player' do
    it 'should update the current player correctly' do
      expect(game.current_player.marker).to eq('X')
      game.update_current_player
      expect(game.current_player.marker).to eq('O')
    end
  end

  describe '#status' do
    it 'should print a message when there is a tie' do
      board.board_grid = %w[X O X 4 O X O O X]
      expect(game.status).to eq(Prompt.print_tie)
    end
  end

  describe '#game_over?' do
    it 'should return false if the game is not over' do
      expect(game.game_over?).to eq(false)
    end

    it 'should return true when the board is full' do
      board.board_grid = %w[X O X X O X O O X]
      expect(game.game_over?).to eq(true)
    end

    it 'should return true when a player has won' do
      board.board_grid = %w[X X X O 5 6 O 8 9]
      expect(game.game_over?).to eq(true)
    end
  end

  def dummy_game
    game.play_turn('O', 1)
    game.play_turn('X', 4)
    game.play_turn('O', 2)
    game.play_turn('X', 5)
    game.play_turn('O', 3)
  end
end
