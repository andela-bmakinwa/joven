require "tilt/erb"

module Joven
  class BaseController
    attr_reader :request

    def initialize(request)
      @request ||= request
    end

    def params
      @request.params
    end

    def response(body, status = 200, header = {})
      @response = Rack::Response.new(body, status, header)
    end

    def get_response
      @response
    end

    def render(*args)
      response(render_template(*args))
    end

    def render_template(view_name, locals = {})
      filename = File.join("app", "views", controller_name, "#{view_name}.erb")
      template = Tilt::ERBTemplate.new(filename)
      vars = {}

      instance_variables.each do |var|
        key = var.to_s.delete("@").to_sym
        vars[key] = instance_variable_get(var)
      end

      template.render(local.merge(vars))
      #Erubis::Eruby.new(template).result(locals.merge(vars))
    end

    def controller_name
      self.class.to_s.gsub(/Controller$/, "").to_snake_case
    end
  end
end