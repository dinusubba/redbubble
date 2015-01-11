require 'spec_helper'

describe Works do
  ########## USE FIXTURE
  let!(:f) { File.open('./works.xml','r') }

  context 'new' do
    it { expect{Works.new}.to raise_error ArgumentError }
    it { expect(Works.new(f).class).to eq Works }
  end

  describe 'parse_xml' do
    let!(:works) { Works.new(f) }
    context 'parse_xml' do
      it { expect(works.all_work.count).to eq 14 }
    end

    context 'models' do
      it { expect(works.models.count).to eq 7 }
    end

    context 'makes' do
      it { expect(works.makes.count).to eq 6 }
    end

    context 'make_of_model' do
      it { expect(works.make_of_model('Canon EOS 400D DIGITAL')).to eq 'Canon' }
      it 'returns blank string if model not found' do
        expect(works.make_of_model('lalala')).to eq ''
      end
    end

    context 'image_urls' do
      it 'limits to 10 if no arg' do
        expect(works.image_urls.count).to eq 10
      end
      it 'returns everything if arg is 0' do
        expect(works.image_urls(0).count).to eq 14
      end
      it 'returns 1 if arg is 1' do
        expect(works.image_urls(1).count).to eq 1
      end
    end

    context 'image_urls' do
      it 'limits to 10 if no arg' do
        expect(works.image_urls_of_make('LEICA').count).to eq 5
      end
      it 'returns 1 if arg is 1' do
        expect(works.image_urls_of_make('LEICA',1).count).to eq 1
      end
    end

    context 'image_urls_of_make_model' do
      it 'returns image_urls matching make and model' do
        expect(works.image_urls_of_make_model('LEICA','D-LUX 3').count).to eq 5
      end
    end
  end
end
