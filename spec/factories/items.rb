FactoryBot.define do
  factory :item do
    item_name {"服"}
    category_id {"2"}
    value {"300"}
    description {"説明文"}
    condition_id {"2"}
    shipping_cost_id{"2"}
    shipping_area_id {"2"}
    shipping_day_id {"2"}
    association :user


    after(:build) do |item_image|
      item_image.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end