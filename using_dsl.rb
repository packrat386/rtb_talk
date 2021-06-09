# lib/rack_to_basics.rb

require 'rack_to_basics/route_dsl'

class RackToBasics
  def initialize(*)
    @router = RackToBasics::RouteDSL.build do |b|
      b.route '/', 'home'
      b.route '/status', 'status'

      b.not_found 'not_found'
    end
  end

  def call(env)
    @router.call(env)
  end
end
