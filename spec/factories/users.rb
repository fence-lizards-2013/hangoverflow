# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'Test User'
    email 'example@example.com'
    password 'changeme'
    overage true
  end

  factory :underage_user, :parent => :user do
    overage false
  end
end
