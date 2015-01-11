require 'spec_helper'

describe TemplateBuilder do
  let!(:template) {
    "{{ TITLE GOES HERE }}" +
    "{{ NAVIGATION GOES HERE }}" +
    "{{ THUMBNAIL IMAGES GO HERE }}"
  }
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
  let!(:works) { Works.new xml }
  let!(:index_builder) { IndexBuilder.new works }
  let!(:expected_output) {
    index_builder.title + index_builder.nav + index_builder.thumbs
  }

  describe 'build' do
    it { expect(TemplateBuilder.build(template, index_builder)).to eq expected_output }
  end
end
