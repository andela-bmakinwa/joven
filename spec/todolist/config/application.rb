require "joven"

$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "app", "controllers")
$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "app", "views")

require "todolist_controller"

module Todolist
  class Application < Joven::Application
  end
end
