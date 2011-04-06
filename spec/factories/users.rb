# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email 'user@custom-domain.com'
    password 'somesamplepassword'
  end
end
