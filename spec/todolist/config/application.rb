require "joven"

$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "app", "controllers")
$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "app", "models")

module Todolist
  require "todolist_controller"
  require "todo"

  class Application < Joven::Application
  end
end
