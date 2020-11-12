FactoryBot.define do
  factory :member do
    user
    websites { [] }
    full_name { "Louis Pasteur" }

    transient do
      passion_topics { [] }
    end

    after(:create) do |member, evaluator|
      website = member.websites.first || create(:website, member: member)
      evaluator.passion_topics.each do |topic|
        member.passions.create(website: website, topic: topic)
      end
    end
  end
end
