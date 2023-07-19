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
require 'rails_helper'

RSpec.describe User, type: :model do

  # この部分
  before do
    @user = create(:user)
  end

  describe 'バリデーション' do
    context 'emailとemailとpasswordどちらも値が設定されている場合' do
      it 'バリデーションが通る' do
        expect(@user.valid?).to eq(true)
      end
    end

    # context 'emailが設定されていない場合' do
    #   it 'バリデーションが通らない' do
    #     @user.email = nil
    #     expect(@user.valid?).to eq(false)
    #   end
    # end

    context 'passwordが設定されていない場合' do
      it 'バリデーションが通らない' do
        @user.password = nil
        expect(@user.valid?).to eq(false)
      end
    end
  end
end
