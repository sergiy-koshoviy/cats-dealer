FactoryBot.define do
  factory :cat do
    breed    { Faker::Cat.breed }
    location { Faker::Address.city }
    price    { Faker::Commerce.price }
    image    { 'image.jpg' }
  end
end
