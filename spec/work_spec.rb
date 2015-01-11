require 'spec_helper'

describe Work do
  context 'new' do
    it 'must have 1 argument' do
      expect{Works.new}.to raise_error ArgumentError
      expect(Works.new("").class).to eq Works
    end
  end

  context 'parse' do
    let!(:builder) {
      ########## TODO: USE FIXTURE ##########
      Nokogiri::XML::Builder.new do |xml|
        xml.works{
          xml.work {
            xml.id "1234"
            xml.filename "1234.jpg"
            xml.image_width "2206"
            xml.image_height "2205"
            xml.urls {
              xml.url('type' => "small") { xml.text 'http://small' }
              xml.url('type' => "medium") { xml.text 'http://medium' }
              xml.url('type' => "large") { xml.text 'http://large' }
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
    it { expect(work.image_url).to eq "http://large" }
  end
end
