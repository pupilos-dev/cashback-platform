FactoryBot.define do
  factory :member do
    email { FFaker::Internet.email }
    password { FFaker::Internet.password }
    admin { true }
  end
end
