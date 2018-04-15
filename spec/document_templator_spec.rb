Struct.new('Income', :name, :amount)

RSpec.describe DocumentTemplator do
  let(:path_to_template_folder) { File.join('./spec', 'templates') }
  let(:path_to_result_folder) { File.join('./spec', 'results') }
  let(:template_name) { '' }
  let(:template_path) { File.join(path_to_template_folder, template_name) }
  let(:result_file_path) { File.join(path_to_result_folder, template_name) }

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

  describe 'text template without erb instructions' do
    let(:template_name) { 'without_erb_template.txt' }

    specify do
      expect(subject.generate(template_path, result_file_path)).to eq(result_file_path)
      expect(File.read(result_file_path)).to eql("Hi, it's template with nothing to change\n")
    end
  end

  describe 'text template with erb instructions' do
    let(:template_name) { 'with_erb_template.txt' }

    context 'without locals variables' do
      let(:locals) { {} }

      specify do
        expect { subject.generate(template_path, result_file_path, locals) }.
          to raise_error(/undefined local variable or method/)
      end
    end

    context 'woth locals variables' do
      let(:locals) do
        {
          name: 'John Doe',
          incomes: [Struct::Income.new('Mason', 200), Struct::Income.new('Jason', 500)]
        }
      end

      specify do
        expect(subject.generate(template_path, result_file_path, locals)).to eq(result_file_path)
        result_file_body = %{Hi John Doe! How are you doing ?
Your incomes:

Mason | 200

Jason | 500

Your Balance is 700
}
        expect(File.read(result_file_path)).to eql(result_file_body)
      end
    end
  end
end
