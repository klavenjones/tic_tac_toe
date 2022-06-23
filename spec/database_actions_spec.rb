# frozen_string_literal: true

require 'sqlite3'
require 'database_actions'

describe DatabaseActions do
  database_name = 'test.db'
  before(:all) do
    ## Initialize database actions
    @db = DatabaseActions.new(database_name)
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
      @db.save_game('X', 'O')
      puts @db.get_all_games
      expect(@db.get_game(1).length).to eq(1)
    end
  end

  describe '#delete_game' do
    it 'should delete a game from the database' do
      @db.save_game('A', 'B')
      @db.delete_game(2)
      result = @sqlite3.execute 'SELECT * FROM games WHERE gameId=?', 2
      expect(result.length).to eq(0)
    end
  end

  describe '#get_all_games' do
    it 'should return a list of all the games' do
      @db.save_game('X', 'B')
      @db.save_game('M', 'N')
      @db.save_game('R', 'S')

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
