require 'erb'

# START TMPL OMIT
class RackToBasics
  class Handlers
    TMPL = <<-ERB
<html>
  <head>
    <title>Greeter</title>
  <head>
  <body>
    <p>Please input your name</p>
    <form method="post">
      <label for="name">Name:</label></br>
      <input type="text" id="name" name="name">
      <input type="submit" value="Greet">
    </form>
    <% if !tmpl_inputs.nil? %>
      <hr>
      <p>Hello <%= tmpl_inputs[:name] %></p>
    <% end %>
  </body>
</html>
ERB
  end
end
# END TMPL OMIT

# START CLASS OMIT
# lib/rack_to_basics/handlers/greeter.rb

class RackToBasics
  class Handlers
    class Greeter
      def call(env)
        req = Rack::Request.new(env)

        if req.post?
          tmpl_inputs = {name: req.params['name']}
        end

        [200, {'Content-Type' => 'text/html'}, [ERB.new(TMPL).result(binding)]]
      end
    end
  end
end
# END CLASS OMIT
