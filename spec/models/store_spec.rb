require 'rails_helper'

RSpec.describe Store, type: :model do
  context 'with wrong params' do
    subject(:store) { described_class.create }

    it 'returns exaption' do
      expect { store }.to raise_error ActiveRecord::NotNullViolation
    end
  end

  context 'with valid params' do
    subject { described_class.create(params) }

    let(:params) do
      {
        name: 'Cats Unlimited',
        api_url: 'https://nh7b1g9g23.execute-api.us-west-2.amazonaws.com/dev/cats/json',
        format_response: 'json',
        mapping_schema: {
          breed:    'name',
          location: 'location',
          price:    'price',
          image:    'image'
        }
      }
    end

    it 'returns exaption' do
      is_expected.to be_persisted
    end
  end
end
