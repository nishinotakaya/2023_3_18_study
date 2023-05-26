require "rails_helper"

RSpec.describe 'Boards', type: :system do

	describe "掲示板に遷移" do
		let!(:user) { FactoryBot.create(:user) }
		let!(:board) { FactoryBot.create(:board) }
	
		context 'ユーザーがログインする' do
			before do
				visit root_path
				fill_in 'session_name', with: user.name
				fill_in 'session_password', with: user.password
				click_button 'ログイン'
			end

			it '掲示板一覧に遷移していること' do
				expect(page).to have_current_path(boards_path)
			end
			
			it '掲示板の作成者が表示されていること' do
				expect(page).to have_content board.name
			end

			it '掲示板のタイトル名が表示されていること' do
				expect(page).to have_content board.title
			end
		end
	end
end