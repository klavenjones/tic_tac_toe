# frozen_string_literal: true

require 'database'

class ResultsDatabaseActions < Database
  def save_result(winner, loser, board)
    @db = SQLite3::Database.open @database_name
    @db.execute "INSERT INTO results (winner, loser, board, date) VALUES (?, ?, ?, date('now'))",
                winner, loser, board
  rescue SQLite3::Exception => e
    print e
  ensure
    @db&.close
  end

  def get_all_results
    @db = SQLite3::Database.open @database_name
    @db.results_as_hash = true
    result = @db.execute 'SELECT * FROM results'
    result
  rescue SQLite3::Exception => e
    print e
  ensure
    @db&.close
  end

  def get_result(result_id)
    @db = SQLite3::Database.open @database_name
    @db.results_as_hash = true
    result = @db.execute 'SELECT * FROM results WHERE resultId=?', result_id
    result
  rescue SQLite3::Exception => e
    print e
  ensure
    @db&.close
  end

  def delete_result(result_id)
    @db = SQLite3::Database.open @database_name
    @db.results_as_hash = true
    result = @db.execute 'DELETE FROM results WHERE resultId=?', result_id
    result
  rescue SQLite3::Exception => e
    print e
  ensure
    @db&.close
  end
end
