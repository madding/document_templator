RSpec.describe DocumentTemplator do
  let(:path_to_template_folder) { './test_templates' }
  subject { DocumentTemplator }

  it 'has a version number' do
    expect(subject::VERSION).not_to be nil
  end

  it 'when template file not found' do
    error_message = 'File ./test_templates/not_exist_file.txt not found'
    expect { subject.generate(File.join(path_to_template_folder, 'not_exist_file.txt')) }.to raise_error(error_message)
  end

  describe 'Simple text template' do
    # it 'right text template' do
    #   expect(subject.generate() ).to eq(true)
    # end
  end
end
