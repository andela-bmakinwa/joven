module Joven
  module Routing
    class Mapper
      def initialize(endpoints)
        @endpoints = endpoints
      end

      def map_to_route(request)
        @request = request
        path   = request.path_info
        method = request.request_method.downcase.to_sym

        result = @endpoints[method].detect do |endpoint|
          match_path_with_pattern path, endpoint
        end

        return Joven::Routing::Route.new(@request, result[:klass_and_method]) if result
      end
 
      def match_path_with_pattern(path, endpoint)
        regexp, placeholders = endpoint[:pattern]
        if path =~ regexp
          match_data = Regexp.last_match
          placeholders.each do |placeholder|
            @request.update_param(placeholder, match_data[placeholder])
          end
          true
        end
      end
    end
  end
end