# START CLASS OMIT
class RackToBasics
  class RouteDSL
    def self.build
      builder = RackToBasics::RouteDSL::Builder.new

      yield builder

      builder.app
    end
    # END CLASS OMIT

    # START BUILDER OMIT
    class Builder
      def initialize
        @routes = {}
        @not_found = nil
      end

      def route(path, handler)
        require "rack_to_basics/handlers/#{handler}"

        klass  = RackToBasics::Handlers.const_get(handler.split('_').map(&:capitalize).join)
        @routes[path] = klass
      end

      def not_found(handler)
        require "rack_to_basics/handlers/#{handler}"

        klass  = RackToBasics::Handlers.const_get(handler.split('_').map(&:capitalize).join)
        @not_found = klass
      end

      def app
        return RackToBasics::RouteDSL::App.new(@routes, @not_found)
      end
    end
    # END BUILDER OMIT

    # START APP OMIT
    class App
      def initialize(routes, not_found)
        @routes = routes
        @not_found = not_found
      end

      def call(env)
        req = Rack::Request.new(env)

        if @routes[req.path]
          @routes[req.path].new.call(env)
        elsif @not_found
          @not_found.new.call(env)
        else
          [404, {}, []] 
        end
      end
    end
    # END APP OMIT
  end
end
