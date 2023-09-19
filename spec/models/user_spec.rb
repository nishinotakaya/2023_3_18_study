require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  describe 'バリデーション' do
    context '名前とパスワードどちらも値が設定されている場合' do
      it 'バリデーションが通る' do
        expect(user.valid?).to eq(true)
      end
    end

    context 'Eメールが設定されていない場合' do
      it 'バリデーションが通らない' do
        user.name = nil
        expect(user.valid?).to eq(false)
      end
    end

    context 'パスワードが設定されていない場合' do
      it 'バリデーションが通らない' do
        user.password = nil
        expect(user.valid?).to eq(false)
      end
    end

    context 'Eメールとパスワードどちらも値が設定されている場合' do
      it 'バリデーションが通る' do
        expect(user.valid?).to eq(true)
       end
    end
  end
end
