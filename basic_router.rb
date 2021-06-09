# lib/rack_to_basics/router.rb

require 'rack_to_basics/home'
require 'rack_to_basics/status'
require 'rack_to_basics/not_found'

class RackToBasics
  class Router
    def call(env)
      req = Rack::Request.new(env)

      case req.path
      when '/'
        RackToBasics::Home.new.call(env)
      when '/status'
        RackToBasics::Status.new.call(env)
      else
        RackToBasics::NotFound.new.call(env)
      end
    end
  end
end
