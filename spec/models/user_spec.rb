require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  context 'Eメールとパスワードどちらも値が設定されている場合' do
    it 'バリデーションが通る' do
      expect(user.valid?).to eq(true)
     end
  end
end
