# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string(255)
#  name            :string(255)      not null
#  password_digest :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_name  (name) UNIQUE
#
FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "TEST#{n}"}
    sequence(:email) { |n| "TEST#{n}@example.com"}
    sequence(:password) { "password" }
  end
end

