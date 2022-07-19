# frozen_string_literal: true

require 'database'

class DatabaseActions < Database
  def build_placeholders(length)
    placeholders = String.new('')
    (1..length).each do |_item|
      placeholders << '?, '
    end
    placeholders
  end

  def save(table, columns, values)
    placeholders = build_placeholders(values.length)
    @db = SQLite3::Database.open @database_name
    @db.execute "INSERT INTO #{table} (#{columns}) VALUES (#{placeholders} date('now'))", values
  rescue SQLite3::Exception => e
    print e
  ensure
    @db&.close
  end

  def get_all(table)
    @db = SQLite3::Database.open @database_name
    @db.results_as_hash = true
    result = @db.execute "SELECT * FROM #{table}"
    result
  rescue SQLite3::Exception => e
    print e
  ensure
    @db&.close
  end

  def get_one(table, id, value)
    @db = SQLite3::Database.open @database_name
    @db.results_as_hash = true
    result = @db.execute "SELECT * FROM #{table} WHERE #{id}=?", value
    result
  rescue SQLite3::Exception => e
    print e
  ensure
    @db&.close
  end

  def delete(table, id, value)
    @db = SQLite3::Database.open @database_name
    @db.results_as_hash = true
    result = @db.execute "DELETE FROM #{table} WHERE #{id}=?", value
    result
  rescue SQLite3::Exception => e
    print e
  ensure
    @db&.close
  end
end
