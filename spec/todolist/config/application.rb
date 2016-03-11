require "joven"

$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "app", "controllers")
 
module Todolist
  class Application < Joven::Application
  end
end