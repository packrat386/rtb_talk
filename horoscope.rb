require 'date'
require 'rack_to_basics/horoscope'

class RackToBasics
  class Handlers
    class Horoscope
      include TemplateHelper

      def call(env)
        req = Rack::Request.new(env)

        if !req.post?
          return render_template 'horoscope'
        end

        bdate = Date.parse(req.params['birthdate'])
        h = RackToBasics::Horoscope.new(bdate)

        render_template 'horoscope', sign: h.sign, prediction: h.todays_prediction
      end
    end
  end
end
