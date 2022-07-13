# frozen_string_literal: true

require 'database'

class GameDatabaseActions < Database
  def save_game(type, current_player, opposing_player, board)
    @db = SQLite3::Database.open @database_name
    @db.execute "INSERT INTO games (type, current_player, opposing_player, board, date) VALUES (?, ?, ?, ?, date('now'))",
                type, current_player, opposing_player, board
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
