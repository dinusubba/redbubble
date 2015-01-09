require 'spec_helper'

describe Works do
  let!(:f) { File.open('./works.xml','r') }

  context 'new' do
    it { expect{Works.new}.to raise_error ArgumentError }
    it { expect(Works.new(f).class).to eq Works }
  end

  context 'parse_xml' do
    let!(:works) { Works.new(f) }

    it { expect(works.works.count).to eq 14 }
  end
end