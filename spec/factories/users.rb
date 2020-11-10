FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email_#{n}@example.com" }
    password { 'test1234' }
  end
end
