# frozen_string_literal: true

require 'sqlite3'
require 'board'
require 'database_actions'

describe DatabaseActions do
  database_name = 'test.db'
  before(:all) do
    ## Initialize database actions
    @db = DatabaseActions.new(database_name)
    @board = Board.new.board_grid.join
    @sqlite3 = SQLite3::Database.open database_name
    @sqlite3.results_as_hash = true
  end

  after(:all) do
    ## Initialize database actions
    @sqlite3.close
    File.delete(database_name)
  end

  describe '#save' do
    it 'should save a result to the database' do
      table = 'results'
      columns = 'winner, loser, board, date'
      values = ['X', 'O', @board]
      @db.save(table, columns, values)
      expect(@db.get_one(table, 'resultId', 1).length).to eq(1)
    end

    it 'should save a game to the database' do
      table = 'games'
      columns = 'type, current_player, opposing_player, board, date'
      values = ['Human vs Human', 'X', 'O', @board]
      @db.save(table, columns, values)
      expect(@db.get_one(table, 'gameId', 1).length).to eq(1)
    end
  end

  describe '#delete' do
    it 'should delete a result from the database' do
      table = 'results'
      columns = 'winner, loser, board, date'
      values = ['X', 'O', @board]
      @db.save(table, columns, values)
      @db.delete(table, 'resultId', 2)
      result = @sqlite3.execute 'SELECT * FROM results WHERE resultId=?', 2
      expect(result.length).to eq(0)
    end

    it 'should delete a game from the database' do
      table = 'results'
      columns = 'type, current_player, opposing_player, board, date'
      values = ['Human vs Human', 'X', 'O', @board]
      @db.save(table, columns, values)
      @db.delete(table, 'gameId', 2)
      result = @sqlite3.execute 'SELECT * FROM games WHERE gameId=?', 2
      expect(result.length).to eq(0)
    end
  end

  describe '#get_all' do
    it 'should return a list of all the results' do
      table = 'results'
      columns = 'winner, loser, board, date'
      values = ['X', 'O', @board]
      @db.save(table, columns, values)
      @db.save(table, columns, values)
      @db.save(table, columns, values)
      expect(@db.get_all(table).length).to eq(4)
    end

    it 'should return a list of all the games' do
      table = 'games'
      columns = 'type, current_player, opposing_player, board, date'
      values = ['Human vs Human', 'X', 'O', @board]
      @db.save(table, columns, values)
      @db.save(table, columns, values)
      @db.save(table, columns, values)
      expect(@db.get_all(table).length).to eq(4)
    end
  end

  describe '#get_one' do
    it 'should return the result where the the resultId = 1' do
      table = 'results'
      result = @db.get_one(table, 'resultId', 1)
      expect(result[0]['resultId']).to eq(1)
    end

    it 'should return the game where the the gameId = 1' do
      table = 'games'
      result = @db.get_one(table, 'gameId', 1)
      expect(result[0]['gameId']).to eq(1)
    end
  end
end
