require 'spec_helper'

describe MakeBuilder do
  let!(:xml) { File.open('./spec/data/2_work.xml') }
  let!(:works) { Works.new(xml) }

  describe 'new' do
    it { expect{MakeBuilder.new}.to raise_error ArgumentError }
    it { expect{MakeBuilder.new('one_arg')}.to raise_error ArgumentError }
    it { expect(MakeBuilder.new(works, 'Canon').class).to eq MakeBuilder }
  end

  describe 'title' do
    it { expect(MakeBuilder.new(works, 'Canon').title).to eq "Redbubble | Canon" }
  end

  describe 'html builder' do
    let!(:make_builder) { MakeBuilder.new(works, 'Canon') }

    context 'nav' do
      let!(:expected_nav) {
        "<ul class=\"button-group\"><li><a class=\" small button\" href=\"index.html\">Index</a></li><li><a class=\" small button\" href=\"canon_eos_20d.html\">Canon EOS 20D</a></li></ul>"
      }

      it { expect(make_builder.nav).to eq expected_nav }
    end

    context 'thumbs' do
      let!(:expected_thumbs) {
        "<ul class=\"small-block-grid-2 large-block-grid-5\"><li><img class=\"th\" src=\"http://ih1.redbubble.net/work.2041.1.flat,550x550,075,f.jpg\"></img></li></ul>"
      }

      it { expect(make_builder.thumbs).to eq expected_thumbs }
    end
  end

end
