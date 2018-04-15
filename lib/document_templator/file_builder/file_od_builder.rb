require 'zip'

module DocumentTemplator
  # Open document, change content and save resulting document for OD format
  class FileOdBuilder < FileBuilder
    def read(template_file)
      content = ''
      Zip::File.open(template_file) do |zip_file|
        entry = zip_file.glob('content.xml').first
        content = entry.get_input_stream.read unless entry.nil?
      end
      content
    end

    def write(changed_content)
      temp_result_file = @result_file + '.tmp'
      FileUtils.cp(@template_file, temp_result_file)

      Zip::File.open(temp_result_file) do |zip_file|
        zip_file.get_output_stream('content.xml') { |f| f.write(changed_content) }
      end

      FileUtils.cp(temp_result_file, @result_file)
    end
  end
end
