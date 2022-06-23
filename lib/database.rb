# frozen_string_literal: true

require 'sqlite3'

class Database
  attr_accessor :database_name

  def initialize(database_name)
    @database_name = database_name
    create_database unless File.file?(@database_name)
    create_table
  end

  def create_database
    @db = SQLite3::Database.new @database_name
    puts @db.get_first_value 'SELECT SQLITE_VERSION()'
  rescue SQLite3::Exception => e
    print e
  ensure
    @db&.close
  end

  def create_table
    @db = SQLite3::Database.open @database_name
    @db.execute <<-SQL
                CREATE TABLE IF NOT EXISTS games (
                gameId INTEGER PRIMARY KEY AUTOINCREMENT,
                winner VARCHAR(1),
                loser VARCHAR(1),#{' '}
                date DATE);
    SQL
  rescue SQLite3::Exception => e
    print e
  ensure
    @db&.close
  end
end
