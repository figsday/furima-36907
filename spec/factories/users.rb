FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             { "日本" }
    first_name            { "太郎" }
    last_name_kana        { "ニホン" }
    first_name_kana       { "タロウ" }
    birthday              { Faker::Date.backward }
  end
end