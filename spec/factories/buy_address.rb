FactoryBot.define do
  factory :buy_address do
    postal_code { '123-1234' }
    shipping_area_id { 2 }
    building_name { '建物名' }
    town { '市町村' }
    address { '1-2-3' }
    phone { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
