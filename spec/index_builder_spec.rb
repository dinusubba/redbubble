require 'spec_helper'

describe IndexBuilder do
  let!(:xml) { File.open('./spec/data/2_work.xml') }
  let!(:works) { Works.new(xml) }

  describe 'new' do
    it { expect{IndexBuilder.new}.to raise_error ArgumentError }
    it { expect(IndexBuilder.new(works).class).to eq IndexBuilder }
  end

  describe 'title' do
    it { expect(IndexBuilder.new(works).title).to eq "Redbubble | Index" }
  end

  describe 'html builder' do
    let!(:index_builder) { IndexBuilder.new(works) }

    context 'nav' do
      let!(:expected_nav) {
        "<ul class=\"button-group\"><li><a class=\"disabled small button\" href=\"index.html\">Index</a></li><li><a class=\" small button\" href=\"nikon_corporation.html\">NIKON CORPORATION</a></li><li><a class=\" small button\" href=\"canon.html\">Canon</a></li></ul>"
      }

      it { expect(index_builder.nav).to eq expected_nav }
    end

    context 'thumbs' do
      let!(:expected_thumbs) {
        "<ul class=\"small-block-grid-2 large-block-grid-5\"><li><img class=\"th\" src=\"http://ih1.redbubble.net/work.31820.1.flat,550x550,075,f.jpg\"></img></li><li><img class=\"th\" src=\"http://ih1.redbubble.net/work.2041.1.flat,550x550,075,f.jpg\"></img></li></ul>"
      }

      it { expect(index_builder.thumbs).to eq expected_thumbs }
    end
  end
end
