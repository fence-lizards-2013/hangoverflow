# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ingredient, :class => 'Ingredients' do
    name "MyString"
    quantity 1
    unitofmeasurement "MyString"
  end
end
