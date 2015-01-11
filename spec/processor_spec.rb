require 'spec_helper'

describe Processor do
  describe 'process' do
    let!(:input_file) { './works.xml' }
    let!(:output_dir) { './test_html' }
    let!(:invalid_input_file) { './lalala.xml' }

    it { expect{Processor.process}.to raise_error ArgumentError }
    it { expect{Processor.process(invalid_input_file)}.to raise_error ArgumentError }
    it { expect{Processor.process(invalid_input_file, output_dir)}.to raise_error InvalidInputFileError }

    context 'happy path' do
      let!(:processor) { Processor.process(input_file, output_dir) }

      it { expect(Dir.exists?(output_dir)).to eq true }
      it 'should contain generated html' do
        dirs = Dir["#{output_dir}/*"]
        expect(dirs.count).to be > 0
        expect(dirs.include?("./test_html/index.html")).to eq true
      end
    end
  end
end
