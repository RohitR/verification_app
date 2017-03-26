FactoryGirl.define do
  factory :email do
    sequence(:email) { |n| "example#{n}@domain.com" }
    confirmed 'false'
  end
end
