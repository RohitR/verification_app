FactoryGirl.define do
  factory :employer do
    name 'Rohith'
    location 'Bangalore'
    password '1234'
    association :phone, factory: :phone
    association :email, factory: :email
  end
end
