require 'document_templator/version'
require 'document_templator/file_builder/file_builder'
require 'document_templator/templator'

# Interface for call file builder
module DocumentTemplator
  def self.generate(template_file, result_file, locals = {})
    raise "File #{template_file} not found" unless File.exist?(template_file)
    templator = Templator.new(locals)
    FileBuilder.new(templator, template_file, result_file).call
  end
end
