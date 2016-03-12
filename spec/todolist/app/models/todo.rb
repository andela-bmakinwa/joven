class Todo < Joven::BaseModel
  to_table :todos

  property :id, type: :integer, primary_key: true, auto_increment: true
  property :name, type: :text, nullable: false
  property :description, type: :text, nullable: false

  create_table
end
