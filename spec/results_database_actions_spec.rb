# frozen_string_literal: true

require 'sqlite3'
require 'board'
require 'results_database_actions'

describe ResultsDatabaseActions do
  database_name = 'test.db'
  before(:all) do
    ## Initialize database actions
    @db = ResultsDatabaseActions.new(database_name)
    @board = Board.new.board_grid.join
    @sqlite3 = SQLite3::Database.open database_name
    @sqlite3.results_as_hash = true
  end

  after(:all) do
    ## Initialize database actions
    @sqlite3.close
    File.delete(database_name)
  end

  describe '#save_result' do
    it 'should save a result to the database' do
      @db.save_result('X', 'O', @board)
      expect(@db.get_result(1).length).to eq(1)
    end
  end

  describe '#delete_result' do
    it 'should delete a result from the database' do
      @db.save_result('A', 'B', @board)
      @db.delete_result(2)
      result = @sqlite3.execute 'SELECT * FROM results WHERE resultId=?', 2
      expect(result.length).to eq(0)
    end
  end

  describe '#get_all_results' do
    it 'should return a list of all the results' do
      @db.save_result('X', 'B', @board)
      @db.save_result('M', 'N', @board)
      @db.save_result('R', 'S', @board)
      expect(@db.get_all_results.length).to eq(4)
    end
  end

  describe '#get_result' do
    it 'should return the result where the the result_id = 1' do
      result = @db.get_result(1)
      expect(result[0]['resultId']).to eq(1)
    end
  end
end
