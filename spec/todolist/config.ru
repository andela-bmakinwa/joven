APP_ROOT ||= __dir__

require "./config/application.rb"
TodoApplication = Todolist::Application.new
require "./config/routes.rb"

run TodoApplication
