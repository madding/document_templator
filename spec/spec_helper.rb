require 'bundler/setup'
require 'document_templator'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.after(:each) do
    result_dir = File.join('./spec', 'results')

    Dir.foreach(result_dir) do |file_name|
      next if %w(. ..).include?(file_name)
      File.delete(File.join(result_dir, file_name))
    end
  end
end
