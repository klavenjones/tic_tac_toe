# frozen_string_literal: true

$LOAD_PATH << './util'
require 'rspec_utils'
require 'sqlite3'
require 'board'
require 'database_actions'

describe DatabaseActions do
  database_name = 'test.db'
  include RspecUtilMethods

  before(:all) do
    @db = DatabaseActions.new(database_name)
    @board = Board.new.board_grid.join
    @sqlite3 = SQLite3::Database.open(database_name, results_as_hash: true)
    @db.create_table('results', 'winner VARCHAR, loser VARCHAR, board VARCHAR')
    @db.create_table('games', 'type VARCHAR, current_player VARCHAR, opposing_player VARCHAR, board VARCHAR')
  end

  after(:all) do
    @sqlite3.close
    File.delete(database_name)
  end

  describe '#save' do
    it 'should save a result to the database' do
      table = 'results'
      columns = 'winner, loser, board, date'
      values = ['X', 'O', @board]
      @db.save(table, columns, values)
      expect(@db.get_one(table, 1).length).to eq(1)
    end

    it 'should save a game to the database' do
      table = 'games'
      columns = 'type, current_player, opposing_player, board, date'
      values = ['Human vs Human', 'X', 'O', @board]
      @db.save(table, columns, values)
      expect(@db.get_one(table, 1).length).to eq(1)
    end
  end

  describe '#delete' do
    it 'should delete a result from the database' do
      table = 'results'
      columns = 'winner, loser, board, date'
      values = ['X', 'O', @board]
      @db.save(table, columns, values)
      @db.delete(table, 2)
      result = @sqlite3.execute 'SELECT * FROM results WHERE id=?', 2
      expect(result.length).to eq(0)
    end

    it 'should delete a game from the database' do
      table = 'results'
      columns = 'type, current_player, opposing_player, board, date'
      values = ['Human vs Human', 'X', 'O', @board]
      @db.save(table, columns, values)
      @db.delete(table, 2)
      result = @sqlite3.execute 'SELECT * FROM games WHERE id=?', 2
      expect(result.length).to eq(0)
    end
  end

  describe '#get_all' do
    it 'should return a list of all the results' do
      table = 'results'
      columns = 'winner, loser, board, date'
      values = ['X', 'O', @board]
      save_items_x_times(@db, table, columns, values, 3)
      expect(@db.get_all(table).length).to eq(4)
    end

    it 'should return a list of all the games' do
      table = 'games'
      columns = 'type, current_player, opposing_player, board, date'
      values = ['Human vs Human', 'X', 'O', @board]
      save_items_x_times(@db, table, columns, values, 3)
      expect(@db.get_all(table).length).to eq(4)
    end
  end

  describe '#get_one' do
    it 'should return the result where the id = 1' do
      table = 'results'
      result = @db.get_one(table, 1)
      expect(result[0]['id']).to eq(1)
    end

    it 'should return the game where the id = 1' do
      table = 'games'
      result = @db.get_one(table, 1)
      expect(result[0]['id']).to eq(1)
    end
  end
end
