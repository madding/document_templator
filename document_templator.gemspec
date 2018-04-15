
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'document_templator/version'

Gem::Specification.new do |spec|
  spec.name          = 'document_templator'
  spec.version       = DocumentTemplator::VERSION
  spec.authors       = ['Eugene Gavrilov']
  spec.email         = ['gavrilov.ea@gmail.com']

  spec.summary       = 'Create OD files fro template file'
  spec.description   = 'Create ODT or ODS from template files, using ERB templating system for create result file'
  spec.homepage      = 'https://github.com/madding/document_templator'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|test_templates|spec|features)/})
  end
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubyzip'
end
