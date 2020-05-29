require 'rails_helper'

describe StoresAdapter, :vcr do
  describe '#call' do
    subject(:fetch) { described_class.call(store) }

    context 'when api response json' do
      let(:store) { create :cats_unlimited_store }
      let(:cat) do
        {
          'breed' => 'Abyssin',
          'price' => 500,
          'location' => 'Lviv',
          'image' => 'https://olxua-ring02.akamaized.net/images_slandocomua/476948786_2_1000x700_abissenysh-chempion-fotografii.jpg'
        }
      end

      it 'returns array' do
        is_expected.to be_a Array
      end

      it 'returns array with cats' do
        expect(fetch.first).to be_a Hash
      end

      it 'returns the cats' do
        expect(fetch.first).to eq cat
      end
    end

    context 'when api response xml' do
      let(:store) { create :happy_cats_store }
      let(:cat) do
        {
          'breed' => 'Siamese',
          'price' => 40,
          'location' => 'Kharkiv',
          'image' => 'https://olxua-ring05.akamaized.net/images_slandocomua/500276292_1_1000x700_kot-po-imeni-tom-borispol.jpg'
        }
      end

      it 'returns array' do
        is_expected.to be_a Array
      end

      it 'returns array with cats' do
        expect(fetch.first).to be_a Hash
      end

      it 'returns the cats' do
        expect(fetch.last).to eq cat
      end
    end
  end
end
