FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {'a123456'}
    password_confirmation {'a123456'}
    first_name_kanji      {'あア阿'}
    last_name_kanji       {'あア阿'}
    first_name_kana       {'アイウエオ'}
    last_name_kana        {'アイウエオ'}
    birthday              {'2020-12-01'}
  end
end