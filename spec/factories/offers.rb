FactoryBot.define do
  factory :offer do
    advertiser_name { "MyString" }
    url { "MyString" }
    description { "MyText" }
    starts_at { "2020-05-16" }
    ends_at { "2020-05-16" }
    premium { false }
  end
end
