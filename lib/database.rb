require 'sqlite3'

class Database 
   
    def create_table 
        begin
            @db = SQLite3::Database.new ":memory:"
            @db = SQLite3::Database.open "test.db"
            @db.execute "CREATE TABLE IF NOT EXISTS games(winner VARCHAR(1), loser VARCHAR(1), date DATE)"
            puts @db.get_first_value 'SELECT SQLITE_VERSION()'
        rescue SQLite3::Exception => e
            print e
        else
            print 'TABLE CREATED!'
        ensure
            print 'Finished Process'
            @db.close if @db
        end
    end

    def create_game
        begin
            @db = SQLite3::Database.open "test.db"
            @db.execute "INSERT INTO games VALUES ('X', 'Y', date('now'))"
        rescue SQLite3::Exception => e
            print e
        else
            print 'VALUES CREATED!'
        ensure
            print 'Finished Process'
            
        end
    end

    

    
    
end