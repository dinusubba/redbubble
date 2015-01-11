require 'spec_helper'

describe IndexBuilder do
    let!(:xml) { %(
<works>
  <work>
    <urls>
      <url type="large">http://url_1.jpg</url>
    </urls>
    <exif>
      <model>NIKON D80</model>
      <make>NIKON CORPORATION</make>
    </exif>
  </work>
  <work>
    <urls>
      <url type="large">http://url_2.jpg</url>
    </urls>
    <exif>
      <model>Canon EOS 20D</model>
      <make>Canon</make>
    </exif>
  </work>
</works>
    )}
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
        "<ul class=\"small-block-grid-2 large-block-grid-5\"><li><img class=\"th\" src=\"http://url_1.jpg\"></img></li><li><img class=\"th\" src=\"http://url_2.jpg\"></img></li></ul>"
      }

      it { expect(index_builder.thumbs).to eq expected_thumbs }
    end
  end
end
