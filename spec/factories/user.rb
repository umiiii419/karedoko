
FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    nickname { Faker::Name.name }
    password { Faker::Internet.password(min_length :6) }
    password_confirmation { password }
  end
end
