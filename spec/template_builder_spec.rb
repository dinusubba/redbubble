require 'spec_helper'

describe TemplateBuilder do
  let!(:template) {
    "{{ TITLE GOES HERE }}" +
    "\n" +
    "{{ NAVIGATION GOES HERE }}" +
    "\n" +
    "{{ THUMBNAIL IMAGES GO HERE }}"
  }
  let!(:xml) { File.open('./spec/data/2_work.xml') }
  let!(:works) { Works.new xml }
  let!(:index_builder) { IndexBuilder.new works }
  let!(:expected_output) {
    index_builder.title +
    "\n" +
    index_builder.nav +
    "\n" +
    index_builder.thumbs
  }

  describe 'build' do
    it { expect(TemplateBuilder.build(template, index_builder)).to eq expected_output }
  end
end
