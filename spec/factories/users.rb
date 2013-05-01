# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "John Smith"
    sequence(:email) {|n| "john.smith.#{n}@example.com" }
    password "password"
  end
end
