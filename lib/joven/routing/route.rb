module Joven
  module Routing
    class Route
      attr_reader :klass_name, :request, :method_name
      def initialize(request, klass_and_method)
        @klass_name, @method_name = klass_and_method
        @request = request
      end
 
      def klass
        klass_name.to_constant
      end
 
      def dispatch
        klass.new.send(method_name)
      end
    end
  end
end