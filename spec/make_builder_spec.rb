require 'spec_helper'

describe MakeBuilder do
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
        "<ul class=\"small-block-grid-2 large-block-grid-5\"><li><img class=\"th\" src=\"http://url_2.jpg\"></img></li></ul>"
      }

      it { expect(make_builder.thumbs).to eq expected_thumbs }
    end
  end

end
