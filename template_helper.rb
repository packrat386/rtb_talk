# lib/rack_to_basics/template_helper.rb

require 'erb'

class RackToBasics
  module TemplateHelper
    def render_template(name, inputs = nil)
      tmpl = ERB.new(File.read(File.join('lib/rack_to_basics/templates', "#{name}.erb")))

      tmpl_inputs = inputs

      [200, {'Content-Type' => 'text/html'}, [tmpl.result(binding)]]
    end
  end
end
