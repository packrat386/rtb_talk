# lib/rack_to_basics/handlers/status.rb

class RackToBasics
  class Handlers
    class Status
      def call(env)
        [200, {'Content-Type' => 'application/json'}, ['{"app":"rtb", "status":"OK"}']]
      end
    end
  end
end
