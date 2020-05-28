require 'rails_helper'

describe CatsService, :vcr do
  describe '#search' do
    subject(:search) { described_class.search(params) }

    let(:params) { {cats_breed: 'Abyssin', location: 'Lviv'} }
    let(:cats_collection) do
      [
        {
          'name' => 'Abyssin',
          'price' => 500,
          'location' => 'Lviv',
          'image' => 'https://olxua-ring02.akamaized.net/images_slandocomua/476948786_2_1000x700_abissenysh-chempion-fotografii.jpg'
        }, {
          'name' => 'Abyssin',
          'price' => '550',
          'location' => 'Lviv',
          'image' => 'https://olxua-ring10.akamaized.net/images_slandocomua/342850976_3_1000x700_abidetki-koti_rev006.jpg'
        }
      ]
    end
    let(:selected_cats) { {cats: cats_collection, lower_price: 500} }

    it 'returns status OK' do
      expect(search.ok?).to be true
    end

    it 'returns selected cats' do
      expect(search.result).to eq selected_cats
    end
  end
end
