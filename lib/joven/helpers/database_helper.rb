require "sqlite3"

module Joven
  module DatabaseHelper
    def self.connect
      db = SQLite3::Database.new(File.join("db", "app.db"))
      db
    end
  end
end
