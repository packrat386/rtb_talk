# lib/rack_to_basics.rb

require 'rack_to_basics/router'

class RackToBasics
  def initialize(*)
    @router = RackToBasics::Router.new
  end

  def call(env)
    @router.call(env)
  end
end
