# lib/rack_to_basics/status.rb

class RackToBasics
  class Status
    def call(env)
      [200, {'Content-Type' => 'application/json'}, ['{"app":"rtb", "status":"OK"}']]
    end
  end
end
