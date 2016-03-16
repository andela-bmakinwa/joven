require "sqlite3"

class Post < Joven::BaseModel
  attr_accessor :id, :title, :body, :created_at
  to_table :posts

  property :id, type: :integer, primary_key: true,
                auto_increment: true, nullable: false
  property :title, type: :text, nullable: false
  property :body, type: :text, nullable: false
  property :created_at, type: :text, nullable: false

  create_table
end
