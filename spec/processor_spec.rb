require 'spec_helper'

describe Processor do
  describe 'process' do
    let!(:input_file) { './works.xml' }
    let!(:output_dir) { './test_html' }
    let!(:invalid_input_file) { './lalala.xml' }

    it { expect{Processor.process}.to raise_error ArgumentError }
    it { expect{Processor.process(invalid_input_file)}.to raise_error ArgumentError }
    it { expect{Processor.process(invalid_input_file, output_dir)}.to raise_error InvalidInputFileError }
  end
end
