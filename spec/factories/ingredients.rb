# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ingredient do
    name "Vodka"
    quantity 1
    unit_of_measurement "oz"
    cocktail
  end
end
