FactoryBot.define do
  factory :member do
    user
    websites { [] }
    full_name { "Louis Pasteur" }

    transient do
      passion_topics { [] }
    end

    after(:create) do |member, evaluator|
      evaluator.passion_topics.each do |topic|
        website = member.websites.first || create(:website, member: member)
        member.passions.create(website: website, topic: topic)
      end
    end
  end
end
