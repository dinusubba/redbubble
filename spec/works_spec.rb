require 'spec_helper'

describe Works do
  let!(:f) { File.open('./works.xml','r') }

  context 'new' do
    it { expect{Works.new}.to raise_error ArgumentError }
    it { expect(Works.new(f).class).to eq Works }
  end

  context 'parse_xml' do
    let!(:works) { Works.new(f) }

    it { expect(works.all_work.count).to eq 14 }
    it { expect(works.uniq_make.count).to eq 6 }
    it { expect(works.uniq_model.count).to eq 7 }
    it { expect(works.all_make.count).to eq 12 }
    it { expect(works.all_model.count).to eq 12 }
  end
end
