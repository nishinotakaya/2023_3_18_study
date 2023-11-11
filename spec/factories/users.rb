FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "TEST#{n}"}
    sequence(:email) { |n| "TEST#{n}@example.com"}
    sequence(:password) { "password" }
  end
end