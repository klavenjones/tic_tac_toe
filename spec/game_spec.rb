# frozen_string_literal: true

require 'game'
require 'player_builder'
require 'board'
require 'prompt'
require 'message'
require 'game_database_actions'
require 'results_database_actions'

describe Game do
  database_name = 'test.db'
  before(:each) do
    @board = Board.new
    @prompt = Prompt.new(@board)
    @game_database_actions = GameDatabaseActions.new(database_name)
    @results_database_actions = ResultsDatabaseActions.new(database_name)
    @player1 = build_player(@prompt, 'X')
    @player2 = build_player(@prompt, 'O')

    @game =
      Game.new(
        board: @board,
        prompt: @prompt,
        player1: @player1,
        player2: @player2,
        game_database_actions: @game_database_actions,
        results_database_actions: @results_database_actions
      )
  end

  after(:each) { File.delete(database_name) }

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
      mark_board_as_tie
      expect { @game.status }.to output(
        "\n\nThe game has ended in a tie.\n\n"
      ).to_stdout
    end

    it 'should print a message when there is a winner' do
      mark_board_as_winner
      expect { @game.status }.to output(
        "\n\nPlayer X is the winner.\n\n"
      ).to_stdout
    end
  end

  describe '#game_over?' do
    it 'should return false if the game is not over' do
      expect(@game.game_over?).to eq(false)
    end

    it 'should return true when the board is full' do
      mark_board_as_tie
      expect(@game.game_over?).to eq(true)
    end

    it 'should return true when a player has won' do
      mark_board_as_winner
      expect(@game.game_over?).to eq(true)
    end
  end

  describe '#end_game' do
    it 'should print that you saved the game successfully based on the player choice' do
      expect(@game.end_game('s')).to eq(@prompt.print_save_game_success)
      expect(@game.end_game('S')).to eq(@prompt.print_save_game_success)
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

def mark_board_as_winner
  @board.mark_board('X', 1)
  @board.mark_board('X', 2)
  @board.mark_board('X', 3)
  @board.mark_board('O', 4)
  @board.mark_board('O', 5)
end

def mark_board_as_tie
  @board.mark_board('O', 1)
  @board.mark_board('O', 2)
  @board.mark_board('X', 3)
  @board.mark_board('X', 4)
  @board.mark_board('X', 5)
  @board.mark_board('O', 6)
  @board.mark_board('O', 7)
  @board.mark_board('O', 8)
  @board.mark_board('X', 9)
end
