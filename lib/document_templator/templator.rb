module DocumentTemplator
  # Change template data
  class Templator
    def initialize(locals = {})
      @locals = locals
    end

    def call(template_body)
      template = ERB.new(template_body)
      template.result(local_binding)
    end

    def local_binding
      bind = binding
      return bind if @locals.empty?

      @locals.each do |variable_name, variable_value|
        bind.local_variable_set(variable_name, variable_value)
      end

      bind
    end
  end
end
