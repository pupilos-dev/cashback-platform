FactoryBot.define do
  factory :offer do
    advertiser_name { "Advertiser" }
    url { "https://www.lemoney.com/" }
    description { "Description" }
    enabled { true }
    starts_at { Date.current }
    ends_at { Date.current }
    premium { false }
    association :member
  end

  factory :offer_premium, class: 'Offer' do
    advertiser_name { FFaker::Company.name }
    url { FFaker::Internet.http_url }
    description { FFaker::Lorem.characters(255) }
    starts_at { Date.current }
    ends_at { Date.tomorrow }
    premium { true }
    association :member
  end

  factory :offer_with_invalid_url, class: 'Offer' do
    advertiser_name { FFaker::Company.name }
    url { FFaker::Company.name }
    description { FFaker::Lorem.characters(255) }
    starts_at { Date.current }
    ends_at { Date.tomorrow }
    premium { true }
    association :member
  end

  factory :offer_without_advertiser_name, class: 'Offer' do
    url { FFaker::Internet.http_url }
    description { FFaker::Lorem.characters(255) }
    starts_at { Date.current }
    ends_at { Date.tomorrow }
    premium { true }
    association :member
  end

  factory :offer_expired, class: 'Offer' do
    advertiser_name { FFaker::Company.name }
    url { FFaker::Internet.http_url }
    description { FFaker::Lorem.characters(255) }
    starts_at { Date.current.advance(months: -1) }
    ends_at { Date.yesterday }
    association :member
  end
end
