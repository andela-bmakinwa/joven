require "joven/version"
require "joven/utility"
require "joven/base_controller"
require "joven/base_model"
require "joven/routing/router"
require "joven/routing/mapper"
require "joven/routing/route"

module Joven
  class Application
    attr_reader :routes

    def initialize
      @routes = Routing::Router.new
    end

    def call(env)
      if env["PATH_INFO"] == "/favicon.ico"
        return [500, {}, []]
      end

      @request = Rack::Request.new(env)
      route = mapper.map_to_route(@request)
      if route
        response = route.dispatch.call(env)
        return [200, { "Content-Type" => "text/html" }, response]
      end
      [404, {}, ["Route not found"]]
    end

    def mapper
      @mapper ||= Routing::Mapper.new(routes.endpoints)
    end
  end
end
