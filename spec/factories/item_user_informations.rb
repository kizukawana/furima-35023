FactoryBot.define do
  factory :item_user_information do
      postal_code { '123-4567'}
      prefecture_id { 6 }
      municipality { '江戸川区' }
      address { '西小岩' }
      building_name {'グランドール'}
      phone_number {'00000000000'}
      token {"tok_abcdefghijk00000000000000000"}
  end
end