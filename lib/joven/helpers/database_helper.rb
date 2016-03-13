require "sqlite3"

module Joven
  module DatabaseHelper
    def self.connect
      SQLite3::Database.new(File.join("db", "app.db"))
    end
  end
end
