FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "password" }
    name { "Kaci" }
    last_name { "Doe" }
    role { :reader }

    factory :admin do
      role { :admin }
    end
  end
end
