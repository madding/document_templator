module DocumentTemplator
  # Open document, change content and save resulting document
  class FileBuilder
    def initialize(templator, template_file, result_file)
      @templator = templator
      @template_file = template_file
      @result_file = result_file
      @result = nil
    end

    def call
      read
      change_content
      write
      @result_file
    end

    def read
      @result = File.read(@template_file)
    end

    def change_content
      @result = @templator.call(@result)
    end

    def write
      File.open(@result_file, 'w') { |file| file.write(@result) }
    end
  end
end
