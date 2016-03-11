require "joven/version"
require "joven/utility"

module Joven
  class Application
    def call(env)
      @request = Rack::Request.new(env)
      path = @request.path_info
      request_method = @request.request_method.downcase
      return [500, {}, []] if path == "/favicon.ico"
      controller, action = get_controller_action(path, request_method)
      response = controller.new.send(action)
      [200, { "Content-Type" => "text/html" }, [response]]
    end

    def get_controller_action(path, verb)
      _, controller_name, action_name = path.split("/")
      require "#{controller_name.downcase}_controller.rb"
      controller = Object.const_get("#{controller_name.capitalize!}Controller")
      action = action_name.nil? ? verb : "#{verb}_#{action_name}"

      [controller, action]
    end
  end
end
