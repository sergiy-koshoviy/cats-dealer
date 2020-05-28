FactoryBot.define do
  factory :store do
    name { 'Cats Unlimited' }
    api_url { 'https://nh7b1g9g23.execute-api.us-west-2.amazonaws.com/dev/cats/json' }
    format_response { 'json' }
    mapping_schema { {breed: 'name', location: 'location', price: 'price', image: 'image'} }
    root_keys { [] }
  end

  factory :cats_unlimited_store, class: 'Store' do
    name { 'Cats Unlimited' }
    api_url { 'https://nh7b1g9g23.execute-api.us-west-2.amazonaws.com/dev/cats/json' }
    format_response { 'json' }
    mapping_schema { {breed: 'name', location: 'location', price: 'price', image: 'image'} }
    root_keys { [] }
  end

  factory :happy_cats_store, class: 'Store' do
    name { 'Happy Cats' }
    api_url { 'https://nh7b1g9g23.execute-api.us-west-2.amazonaws.com/dev/cats/xml' }
    format_response { 'xml' }
    mapping_schema { {breed: 'title', location: 'location', price: 'cost', image: 'img'} }
    root_keys { %w[cats cat] }
  end
end
