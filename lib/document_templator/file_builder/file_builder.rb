module DocumentTemplator
  # Open document, change content and save resulting document
  class FileBuilder
    def initialize(templator, template_file, result_file)
      @templator = templator
      @template_file = template_file
      @result_file = result_file
    end

    def call
      content = read(@template_file)
      changed_content = change_content(content)
      write(changed_content)
      @result_file
    end

    def read(template_file)
      File.read(template_file)
    end

    def change_content(content)
      @templator.call(content)
    end

    def write(changed_content)
      File.open(@result_file, 'w') { |file| file.write(changed_content) }
    end
  end
end
