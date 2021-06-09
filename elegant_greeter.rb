# lib/rack_to_basics/handlers/greeter.rb

class RackToBasics
  class Handlers
    class Greeter
      include RackToBasics::TemplateHelper

      def call(env)
        req = Rack::Request.new(env)

        if req.post?
          render_template 'greeter', {name: req.params['name']}
        else
          render_template 'greeter'
        end
      end
    end
  end
end
