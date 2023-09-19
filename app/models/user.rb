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
class User < ApplicationRecord
  has_secure_password
  
  # validates :name,
  # presence: true,
  # uniqueness: true,
  # length: { maximum: 16 },
  # format: {
  #   with: /\A[a-z0-9]+\z/,
  #   message: 'は小文字英数字で入力してください'
  # }

  has_many :boards

  validates :name, presence: true

  validates :password, presence: true
  
  def addition
    1 + 1
  end
end
