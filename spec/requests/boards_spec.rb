require "rails_helper"

RSpec.describe 'Boards', type: :system do

	# describe "掲示板に遷移" do
	# 	let!(:user) { FactoryBot.create(:user) }
	# 	let!(:board) { FactoryBot.create(:board) }
	
	# 	context 'ユーザーがログインする' do
	# 		before do
	# 			visit root_path
	# 			fill_in 'session_name', with: user.name
	# 			fill_in 'session_password', with: user.password
	# 			click_button 'ログイン'
	# 		end

	# 		it '掲示板一覧に遷移していること' do
	# 			expect(page).to have_current_path(boards_path)
	# 		end

	# 		it '掲示板の作成者が表示されていること' do
	# 			expect(page).to have_content board.name
	# 		end

	# 		it '掲示板のタイトル名が表示されていること' do
	# 			expect(page).to have_content board.title
	# 		end
	# 	end
	# end

  describe '計算' do
    context '12 + 6の場合' do
      it '18 になること' do
        expect(12 + 6).to eq 18
      end
      it '20にはならない' do
        expect(12 + 6).not_to eq 20
      end
    end
  
    context '6 × 4の場合' do
      it '24になること' do
        expect(6 * 4).to eq 24
      end
      it '30にはならない' do
        expect(6 * 4).not_to eq 30
      end
    end
  
    context '100 ÷ 20の場合' do
      it '5になること' do
        expect(100 / 20).to eq 5
      end
      it '6にはならない' do
        expect(100 / 20).not_to eq 6
      end
    end
  end

end