Store.destroy_all

Store.create!(
  [
    {
      name: 'Cats Unlimited',
      api_url: 'https://nh7b1g9g23.execute-api.us-west-2.amazonaws.com/dev/cats/json',
      format_response: 'json',
      mapping_schema: {
        breed:    'name',
        location: 'location',
        price:    'price',
        image:    'image'
      },
      root_keys: []
    }, {
      name: 'Happy Cats',
      api_url: 'https://nh7b1g9g23.execute-api.us-west-2.amazonaws.com/dev/cats/xml',
      format_response: 'xml',
      mapping_schema: {
        breed:    'title',
        location: 'location',
        price:    'cost',
        image:    'img'
      },
      root_keys: ['cats', 'cat']
    }
  ]
)

p "Created #{Store.count} stores"
