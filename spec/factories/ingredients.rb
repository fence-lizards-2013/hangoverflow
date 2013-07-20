# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ingredient do
    name { Faker::Address.city }
    quantity 2
    unit_of_measurement { ["Tablespoons", "ml", "oz"].sample }
    cocktail
  end
end
