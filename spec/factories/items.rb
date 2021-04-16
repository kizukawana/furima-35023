FactoryBot.define do
  factory :item do
    association        :user
    name               {"名前"}
    explanation        {"説明"}
    category_id        {1}
    condition_id       {1}
    delivery_fee_id    {1}
    area_id            {1}
    delivery_day_id    {1}
    price              {2000}
    after(:build) do |item|
      item.image.attach(io: File.open('spec/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
