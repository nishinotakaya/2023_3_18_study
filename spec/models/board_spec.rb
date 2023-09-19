require 'rails_helper'

RSpec.describe Board, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:board) { FactoryBot.build(:board, user: user) }

  context '有効な名前、タイトル、本文が存在する場合' do
    it '登録される' do
      expect(board).to be_valid
    end
  end

  context '名前が入力されていない場合' do
    it 'バリデーションがかかる' do
      board.name = nil
      expect(board).to_not be_valid
    end
  end

  context '名前が10文字を超える場合' do
    it 'バリデーションがかかる' do
      board.name = 'a' * 11
      expect(board).to_not be_valid
    end
  end

  context 'タイトルが入力されていない場合' do
    it 'バリデーションがかかる' do
      board.title = nil
      expect(board).to_not be_valid
    end
  end

  context 'タイトルが31文字以上の場合' do
    it 'バリデーションがかかる' do
      board.title = 'a' * 31
      expect(board).to_not be_valid
    end
  end

  context '本文が入力されていない場合' do
    it 'バリデーションがかかる' do
      board.body = nil
      expect(board).to_not be_valid
    end
  end

  context '本文が1000文字を超えている場合' do
    it 'バリデーションがかかる' do
      board.body = 'a' * 1001
      expect(board).to_not be_valid
    end
  end
end