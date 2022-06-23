# frozen_string_literal: true

require 'database'

class DatabaseActions < Database
  def save_game(player1, player2)
    @db = SQLite3::Database.open @database_name
    @db.execute "INSERT INTO games (winner, loser, date) VALUES (?, ?, date('now'))", player1, player2
  rescue SQLite3::Exception => e
    print e
  ensure
    @db&.close
  end

  def get_all_games
    @db = SQLite3::Database.open @database_name
    @db.results_as_hash = true
    result = @db.execute 'SELECT * FROM games'
    result
  rescue SQLite3::Exception => e
    print e
  ensure
    @db&.close
  end

  def get_game(game_id)
    @db = SQLite3::Database.open @database_name
    @db.results_as_hash = true
    result = @db.execute 'SELECT * FROM games WHERE gameId=?', game_id
    result
  rescue SQLite3::Exception => e
    print e
  ensure
    @db&.close
  end

  def delete_game(game_id)
    @db = SQLite3::Database.open @database_name
    @db.results_as_hash = true
    result = @db.execute 'DELETE FROM games WHERE gameId=?', game_id
    result
  rescue SQLite3::Exception => e
    print e
  ensure
    @db&.close
  end
end
