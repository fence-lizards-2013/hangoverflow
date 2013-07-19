# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cocktail do
    name "Vodka Martini"
    description "Is Delicious"
    instructions "Mix and Match"
    user
  end
end
