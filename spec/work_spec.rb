require 'spec_helper'

describe Work do
  context 'new' do
    let!(:builder) {
      Nokogiri::XML::Builder.new do |xml|
        xml.works{
          xml.work {
            xml.id "1234"
            xml.filename "1234.jpg"
            xml.image_width "2206"
            xml.image_height "2205"
            xml.urls {
              xml.url(:type => "small") { 'http://small' }
              xml.url(:type => "medium") { 'http://medium' }
              xml.url(:type => "large") { 'http://large' }
            }
            xml.exif {
              xml.model "NIKON D80"
              xml.make "NIKON CORPORATION"
            }
          }
        }
      end
    }
    let!(:works) {
      Nokogiri::XML(builder.to_xml) do |config|
        config.noblanks
      end
    }
    let!(:work) { Work.new(works.child) }

    it { expect(work.id).to eq 1234 }
    it { expect(work.make).to eq "NIKON CORPORATION" }
    it { expect(work.model).to eq "NIKON D80" }
  end
end
