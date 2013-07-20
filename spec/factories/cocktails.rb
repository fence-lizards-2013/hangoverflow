# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cocktail do
    name { Faker::Name.name }
    description { Faker::Lorem.sentence }
    instructions { Faker::Lorem.sentence }
    user
  end
end
