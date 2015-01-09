require 'spec_helper'

describe Processor do
  context 'new' do
    let!(:invalid_input_file) { './lalala.xml' }
    let!(:valid_input_file) { './works.xml' }
    let!(:valid_output_dir) { './test_html' }

    it { expect{Processor.new}.to raise_error NoInputFileError }
    it { expect{Processor.new(invalid_input_file)}.to raise_error NoOutputDirError }
    it { expect{Processor.new(invalid_input_file, valid_output_dir)}.to raise_error Errno::ENOENT }
    it { expect(Processor.new(valid_input_file, valid_output_dir).class).to eq Processor }
  end

  describe 'abracadabra' do
    let!(:input_file) { './works.xml' }
    let!(:output_dir) { './test_html' }
    let!(:processor) { Processor.new(input_file, output_dir) }
  end

end
