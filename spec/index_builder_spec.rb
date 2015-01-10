require 'spec_helper'

describe IndexBuilder do
  let!(:xml) { File.open('./works.xml','r') }
  let!(:works) { Works.new(xml) }

  context 'new' do
    it { expect{IndexBuilder.new}.to raise_error ArgumentError }
    it { expect(IndexBuilder.new(works).class).to eq IndexBuilder }
  end

  context 'title' do
    it { expect(IndexBuilder.new(works).title).to eq "Index" }
  end

  describe 'html builder' do
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
    let!(:index_builder) { IndexBuilder.new(works) }

    context 'nav' do
      let!(:expected_nav) {
        "<div class=\"nav\"><ul><li><a href=\"nikon_corporation.html\">NIKON CORPORATION</a></li><li><a href=\"canon.html\">Canon</a></li></ul></div>"
      }

      it { expect(index_builder.nav).to eq expected_nav }
    end

    context 'thumbs' do
      let!(:expected_thumbs) {
        "<div class=\"thumbs\"><div class=\"thumb\"><img src=\"http://url_1.jpg\"></img></div><div class=\"thumb\"><img src=\"http://url_2.jpg\"></img></div></div>"
      }

      it { expect(index_builder.thumbs).to eq expected_thumbs }
    end
  end
end
