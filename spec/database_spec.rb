# frozen_string_literal: true

require 'database'
require 'sqlite3'

describe Database do
  database_name = 'test.db'

  after(:each) do
    File.delete(database_name)
  end

  describe '#intialize' do
    it 'should create the database if it does not exists' do
      expect(File.file?(database_name)).to eq(false)
      Database.new(database_name)
      expect(File.file?(database_name)).to eq(true)
    end

    it 'should not throw an error if a database does exist' do
      Database.new(database_name)

      expect(File.file?(database_name)).to eq(true)
    end
  end

  describe '#create_database' do
    it 'should create a database' do
      Database.new(database_name)

      sqlite3 = SQLite3::Database.open database_name
      expect(sqlite3.get_first_value('SELECT SQLITE_VERSION()')).to_not eq(nil)

      sqlite3.close
    end
  end

  describe '#create_table' do
    it 'should create a table names games' do
      db = Database.new(database_name)

      db.create_table
      sqlite3 = SQLite3::Database.open database_name
      sqlite3.results_as_hash = true
      result = sqlite3.execute "SELECT name FROM sqlite_master WHERE type='table' AND name='games'"
      expect(result.length).to eq(1)
      expect(result[0]['name']).to eq('games')

      sqlite3.close
    end
  end
end
