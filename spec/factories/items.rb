FactoryBot.define do
  factory :item do
    item_name         { Faker::Name.name }
    price             { 500 }
    description       { 'aaa' }
    condition_id      { 2 }
    category_id       { 2 }
    region_id         { 2 }
    delivery_time_id  { 2 }
    shipping_fee_id   { 2 }

    user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/a.png'), filename: 'a.png')
    end
  end
end
