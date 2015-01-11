require 'spec_helper'

describe Works do
  let!(:f) { File.open('./spec/data/works.xml','r') }

  context 'new' do
    it { expect{Works.new}.to raise_error ArgumentError }
    it { expect(Works.new(f).class).to eq Works }
  end

  describe 'parse_xml' do
    let!(:works) { Works.new(f) }
    context 'parse_xml' do
      it { expect(works.all_work.count).to eq 20 }
    end

    context 'makes' do
      it { expect(works.makes.count).to eq 4 }
    end

    context 'models' do
      it { expect(works.models.count).to eq 8 }
    end

    context 'make_of_model' do
      it { expect(works.make_of_model('MAKE 2MODEL 2')).to eq 'MAKE 2' }
      it 'returns blank string if model not found' do
        expect(works.make_of_model('lalala')).to eq ''
      end
    end

    context 'image_urls' do
      it 'limits to 10 if no arg' do
        expect(works.image_urls.count).to eq 10
      end
      it 'returns everything if arg is 0' do
        expect(works.image_urls(0).count).to eq 20
      end
      it 'returns 1 if arg is 1' do
        expect(works.image_urls(1).count).to eq 1
      end
    end

    context 'image_urls' do
      it 'limits to 10 if no arg' do
        expect(works.image_urls_of_make('MAKE 1').count).to eq 10
      end
      it 'returns everything if arg is 0' do
        expect(works.image_urls_of_make('MAKE 1', 0).count).to eq 15
      end
      it 'returns 1 if arg is 1' do
        expect(works.image_urls_of_make('MAKE 1',1).count).to eq 1
      end
      it 'returns empty array if make not found' do
        expect(works.image_urls_of_make('lalala').count).to eq 0
      end
    end

    context 'image_urls_of_make_model' do
      it 'returns image_urls matching make and model' do
        expect(works.image_urls_of_make_model('MAKE 1','MAKE 1MODEL 1').count).to eq 12
      end
      it 'returns empty array if make not found' do
        expect(works.image_urls_of_make('lalala','bababa').count).to eq 0
      end
    end
  end
end
