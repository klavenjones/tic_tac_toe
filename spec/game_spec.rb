# frozen_string_literal: true

$LOAD_PATH << './util'
require 'rspec_utils'
require 'game'
require 'player_builder'
require 'board'
require 'lite3_board'
require 'prompt'
require 'message'
require 'database_actions'

# rubocop:disable Metrics/BlockLength
describe Game do
  database_name = 'test.db'
  include RspecUtilMethods

  before(:each) do
    @board = Board.new
    @prompt = Prompt.new(@board)
    @database_actions = DatabaseActions.new(database_name)
    @players = [
      build_player(PlayerBuilder.new, @prompt, 'X'),
      build_player(PlayerBuilder.new, @prompt, 'O')
    ]

    @game =
      Game.new(
        board: @board,
        prompt: @prompt,
        players: @players,
        database_actions: @database_actions
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
      @game.set_current_player(@game.players[1])
      expect(@game.current_player.marker).to eq('O')
    end
  end

  describe '#set_winning_player' do
    it 'should set player to winning player and return marker O' do
      @game.set_winning_player(@game.players[1])
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
      mark_board_as_tie(@board)
      expect { @game.status }.to output(
        "\n\nThe game has ended in a tie.\n\n"
      ).to_stdout
    end

    it 'should print a message when there is a winner' do
      mark_board_as_winner(@board)
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
      mark_board_as_tie(@board)
      expect(@game.game_over?).to eq(true)
    end

    it 'should return true when a player has won' do
      mark_board_as_winner(@board)
      expect(@game.game_over?).to eq(true)
    end
  end

  describe '#end_game' do
    it 'should print that you saved the game successfully based on the player choice' do
      expect(@game.end_game('s')).to eq(@prompt.print_save_game_success)
      expect(@game.end_game('S')).to eq(@prompt.print_save_game_success)
    end
  end

  context 'A full game played with normal Board' do
    it 'should be true when there is a winner of the game' do
      update_game_board_x_times(@board, 9)
      board = @game.board
      expect(board.winner?).to eq(true)
    end

    it 'should only have four spaces available after five turns' do
      update_game_board_x_times(@board, 5)
      board = @game.board
      expect(board.spaces_available.length).to eq(4)
    end
  end

  context 'A full game played with Lite3 Board' do
    before(:each) do
      @lite3_board = Lite3Board.new
      @prompt = Prompt.new(@board)
      @database_actions = DatabaseActions.new(database_name)

      @players = [
        build_player(PlayerBuilder.new, @prompt, 'X'),
        build_player(PlayerBuilder.new, @prompt, 'O')
      ]

      @game =
        Game.new(
          board: @lite3_board,
          prompt: @prompt,
          players: @players,
          database_actions: @database_actions
        )
    end

    it 'should never be a win or tie' do
      update_game_board_x_times(@lite3_board, 9)
      board = @game.board
      expect(board.winner?).to eq(false)
    end

    it 'should always have five spaces available after more then 5 moves ' do
      update_game_board_x_times(@lite3_board, 9)
      board = @game.board
      expect(board.spaces_available.length).to eq(5)
    end
  end
end
# rubocop:enable Metrics/BlockLength
