FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    first_name { '山田' }
    last_name { '太郎' }
    first_name_furigana { 'ヤマダ' }
    last_name_furigana { 'タロウ' }
    birth_date { '2000-01-01' }
    email { Faker::Internet.free_email }
    password = '1a' + Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
  end
end
