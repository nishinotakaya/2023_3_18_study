FactoryBot.define do
  factory :board do
    name { "HIKAKIN" }
    sequence(:title) { |n| "Ruby #{n}" }
    sequence(:body) { |n| "Content #{n}" }
  end
end
