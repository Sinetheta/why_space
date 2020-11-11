FactoryBot.define do
  factory :friendship do
    association :from_member, factory: :member
    association :to_member, factory: :member
  end
end
