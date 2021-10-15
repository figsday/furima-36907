FactoryBot.define do
  factory :order_address do
    token           { 'token' }
    postal_code     { '000-0000' }
    region_id       { 2 }
    city            { Faker::Address.city }
    block_num       { Faker::Name.name }
    building_name   { '建物名' }
    phone_num       { '00000000000' }
  end
end
