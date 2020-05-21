FactoryBot.define do
  factory :admin, class: 'Member' do
    email { FFaker::Internet.email }
    password { FFaker::Internet.password }
    admin { true }
  end

  factory :member do
    email { FFaker::Internet.email }
    password { FFaker::Internet.password }
  end
end
