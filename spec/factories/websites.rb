FactoryBot.define do
  factory :website do
    member
    full_url { "https://long-link.com" }
    short_url { "https://short.com" }
  end
end
