RSpec.describe DocumentTemplator do
  let(:path_to_template_folder) { File.join(__dir__, 'templates') }
  let(:path_to_result_folder) { File.join(__dir__, 'results') }
  let(:template_name) { '' }
  let(:template_path) { File.join(path_to_template_folder, template_name) }

  subject { DocumentTemplator }

  it 'has a version number' do
    expect(subject::VERSION).not_to be nil
  end

  describe 'when template file not found' do
    let(:template_name) { 'not_exist_file.txt' }

    specify do
      expect { subject.generate(template_path, '') }.to raise_error("File #{template_path} not found")
    end
  end

  describe 'Simple text template' do
    let(:template_name) { 'without_erb_template.txt' }
    let(:result_file_path) { File.join(path_to_result_folder, template_name) }

    it 'text template without erb commands' do
      expect(subject.generate(template_path, result_file_path)).to eq(result_file_path)
      expect(File.read(result_file_path)).to eql("Hi, it's template with nothing to change\n")
    end
  end
end
