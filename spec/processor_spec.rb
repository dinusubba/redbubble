require 'spec_helper'

describe Processor do
  let!(:input_file) { './works.xml' }
  let!(:output_dir) { './test_html' }
  describe 'new' do
    let!(:invalid_input_file) { './lalala.xml' }

    it { expect{Processor.new}.to raise_error ArgumentError }
    it { expect{Processor.new(invalid_input_file)}.to raise_error ArgumentError }
    it { expect{Processor.new(invalid_input_file, output_dir)}.to raise_error InvalidInputFileError }
    it { expect(Processor.new(input_file, output_dir).class).to eq Processor }
  end

  describe 'works' do
    let!(:processor) { Processor.new(input_file, output_dir) }
    it { expect(processor.works_count).to eq 14 }
  end
end
