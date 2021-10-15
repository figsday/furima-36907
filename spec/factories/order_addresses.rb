FactoryBot.define do
  factory :order_address do
    token           { "token"}
    postal_code     { "000-0000" }
    region_id       { 2 }
    city            { Faker::Address.city }
    block_num       { Faker::Name.name }
    building_name   { "" }
    phone_num       { 12345678900 }
    item_id         { 1 }
    user_id         { 1 }
  end
end
