APP_ROOT ||= __dir__

require "./config/application.rb"

BlogApplication = Blog::Application.new

require "./config/routes.rb"

run BlogApplication
