# frozen_string_literal: true

require 'sqlite3'

class Database
  attr_accessor :database_name

  def initialize(database_name)
    @database_name = database_name
    create_database unless File.file?(@database_name)
  end

  def open_db
    @db = SQLite3::Database.open @database_name
    @db.results_as_hash = true
  end

  def create_database
    @db = SQLite3::Database.new @database_name
    puts @db.get_first_value 'SELECT SQLITE_VERSION()'
  rescue SQLite3::Exception => e
    print e
  ensure
    @db&.close
  end

  def create_table(table, columns)
    open_db
    @db.execute("CREATE TABLE IF NOT EXISTS #{table} (id INTEGER PRIMARY KEY AUTOINCREMENT, #{columns}, date DATE)")
  rescue SQLite3::Exception => e
    print e
  ensure
    @db&.close
  end
end
