require "joven/version"
require "joven/utility"
require "joven/routing/router"

module Joven
  class Application
    attr_reader :routes
 
    def initialize
      @routes = Routing::Router.new
    end
 
    def call(env)
      @request = Rack::Request.new(env)
      route = mapper.map_to_route(@request)
      if route
        response = route.dispatch
        return [200, { "Content-Type" => "text/html" }, [response]]
      end
      [404, {}, ["Route not found"]]
    end
 
    def mapper
      @mapper ||= Routing::Mapper.new(routes.endpoints)
    end
  end
end