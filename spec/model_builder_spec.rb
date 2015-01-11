require 'spec_helper'

describe ModelBuilder do

  ########### MOVE THIS INTO FIXTURE AND ADD MORE WORKS

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
    it { expect{ModelBuilder.new}.to raise_error ArgumentError }
    it { expect{ModelBuilder.new('one_arg')}.to raise_error ArgumentError }
    it { expect(ModelBuilder.new(works, 'Canon EOS 20D').class).to eq ModelBuilder }
  end

  describe 'title' do
    it { expect(ModelBuilder.new(works, 'Canon EOS 20D').title).to eq "Redbubble | Canon | Canon EOS 20D" }
  end

  describe 'html builder' do
    let!(:model_builder) { ModelBuilder.new(works, 'Canon EOS 20D') }

    context 'nav' do
      let!(:expected_nav) {
        "<ul class=\"button-group\"><li><a class=\" small button\" href=\"index.html\">Index</a></li><li><a class=\" small button\" href=\"canon.html\">Canon</a></li></ul>"
      }

      it { expect(model_builder.nav).to eq expected_nav }
    end

    context 'thumbs' do
      let!(:expected_thumbs) {
        "<ul class=\"small-block-grid-2 large-block-grid-5\"><li><img class=\"th\" src=\"http://url_2.jpg\"></img></li></ul>"
      }

      it { expect(model_builder.thumbs).to eq expected_thumbs }
    end
  end

end
