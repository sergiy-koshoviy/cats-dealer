require 'rails_helper'

describe StoresService, :vcr do
  describe '#parse_response' do
    subject(:parse_response) { described_class.parse_response(data, format, root_keys) }

    context 'when data is json' do
      let(:data) {
        '[{"name":"Abyssin","price":500,"location":"Lviv","image":"https://olxua-ring02.akamaized.net/images_slandocomua/476948786_2_1000x700_abissenysh-chempion-fotografii.jpg"}]'
      }
      let(:format) { 'json' }
      let(:root_keys) { [] }
      let(:parsed_data) do
        [
          {
            "name" => "Abyssin",
            "price" => 500,
            "location" => "Lviv",
            "image" => "https://olxua-ring02.akamaized.net/images_slandocomua/476948786_2_1000x700_abissenysh-chempion-fotografii.jpg"
          }
        ]
      end

      it 'returns status OK' do
        expect(parse_response.ok?).to be true
      end

      it 'returns parsed data' do
        expect(parse_response.result).to eq parsed_data
      end
    end

    context 'when data is xml' do
      let(:data) {
        "<?xml version=\"1.0\" encoding=\"UTF-8\"?><cats><cat><title>American Curl</title><cost>650</cost><location>Odessa</location><img>https://olxua-ring07.akamaized.net/images_slandocomua/113528769_3_1000x700_amerikanskie-kerly-koshki-s-chelovecheskim-litsom-koshka-kompanon-koti_rev022.jpg</img></cat></cats>"
      }
      let(:format) { 'xml' }
      let(:root_keys) { %w[cats cat] }
      let(:parsed_data) do
        {
          "title" => "American Curl",
          "cost" => "650",
          "location" => "Odessa",
          "img" => "https://olxua-ring07.akamaized.net/images_slandocomua/113528769_3_1000x700_amerikanskie-kerly-koshki-s-chelovecheskim-litsom-koshka-kompanon-koti_rev022.jpg"
        }
      end

      it 'returns status OK' do
        expect(parse_response.ok?).to be true
      end

      it 'returns parsed data' do
        expect(parse_response.result).to eq parsed_data
      end
    end
  end
end
