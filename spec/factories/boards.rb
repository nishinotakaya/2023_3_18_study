FactoryBot.define do
  factory :board do
   sequence(:name) { |n| "NAME #{n}"}
   sequence(:title) { |n| "TEST TITLE #{n}"}
   sequence(:body) { |n| "TEST BODY #{n}"}
   association :user
 end
end
