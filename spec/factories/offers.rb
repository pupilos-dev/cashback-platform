FactoryBot.define do
  factory :offer do
    advertiser_name { FFaker::Name.name }
    url { "https://www.lemoney.com/" }
    description { "Description" }
    state { false }
    starts_at { "2020-05-16" }
    ends_at { "2020-05-16" }
    premium { false }
    member_id { FactoryBot.create(:member).id }
  end
end
