FactoryGirl.define do
  factory :member do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    passoword { Faker::Internet.password }
    password_confirmation { Faker::Internet.password_confirmation }
  end
end
