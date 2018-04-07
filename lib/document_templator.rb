require 'document_templator/version'

# Interface for call file builder
module DocumentTemplator
  def self.generate(template_file, _locals = {})
    raise "File #{template_file} not found" unless File.exist?(template_file)
  end
end
