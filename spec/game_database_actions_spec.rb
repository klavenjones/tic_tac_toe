# frozen_string_literal: true

require 'sqlite3'
require 'board'
require 'game_database_actions'

describe GameDatabaseActions do
  database_name = 'test.db'
  before(:all) do
    ## Initialize database actions
    @db = GameDatabaseActions.new(database_name)
    @board = Board.new.board_grid.join('')
    
    @sqlite3 = SQLite3::Database.open database_name
    @sqlite3.results_as_hash = true
  end

  after(:all) do
    ## Initialize database actions
    @sqlite3.close
    File.delete(database_name)
  end

  describe '#save_game' do
    it 'should save a game to the database' do
     @db.save_game("Human vs Human", 'X', 'O', @board)
     expect(@db.get_game(1).length).to eq(1)
    end
  end

  describe '#delete_game' do
    it 'should delete a game from the database' do
      @db.save_game("Human vs Human", 'A', 'B',  @board)
      @db.delete_game(2)
      result = @sqlite3.execute 'SELECT * FROM games WHERE gameId=?', 2
      expect(result.length).to eq(0)
    end
  end

  describe '#get_all_games' do
    it 'should return a list of all the games' do
      @db.save_game("Human vs Human", 'X', 'B', @board)
      @db.save_game("Human vs Human", 'M', 'N', @board)
      @db.save_game("Human vs Human", 'R', 'S', @board)
      expect(@db.get_all_games.length).to eq(4)
    end
  end

  describe '#get_game' do
    it 'should return the game where the the game_id = 1' do
      result = @db.get_game(1)
      expect(result[0]['gameId']).to eq(1)
    end
  end
end
