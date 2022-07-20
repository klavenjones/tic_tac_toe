# frozen_string_literal: true

require 'database'

class DatabaseActions < Database
  def save(table, columns, values)
    placeholders = build_placeholders(values.length)
    open_db
    @db.execute "INSERT INTO #{table} (#{columns}) VALUES (#{placeholders} date('now'))", values
  rescue SQLite3::Exception => e
    print e
  ensure
    @db&.close
  end

  def get_all(table)
    open_db
    result = @db.execute "SELECT * FROM #{table}"
    result
  rescue SQLite3::Exception => e
    print e
  ensure
    @db&.close
  end

  def get_one(table, value)
    open_db
    result = @db.execute "SELECT * FROM #{table} WHERE id=?", value
    result
  rescue SQLite3::Exception => e
    print e
  ensure
    @db&.close
  end

  def delete(table, value)
    open_db
    result = @db.execute "DELETE FROM #{table} WHERE id=?", value
    result
  rescue SQLite3::Exception => e
    print e
  ensure
    @db&.close
  end

  def build_placeholders(length)
    placeholders = String.new('')
    (1..length).each do |_item|
      placeholders << '?, '
    end
    placeholders
  end
end
