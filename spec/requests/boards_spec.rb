require "rails_helper"

RSpec.describe 'Boards', type: :system do

	describe "掲示板に遷移" do
		let(:user) { FactoryBot.create(:user) }
		let(:board) { FactoryBot.create(:article, title: 'Rubyについて', subtitle: 'Ruby') }
	
		context 'ログイン後に記事一覧に遷移' do
			before do
				visit login_path
				fill_in 'Email', with: user.name
				fill_in 'Password', with: user.password
				click_button 'ログイン'
				visit boards_path  # 記事一覧ページへ遷移
			end
		end
	
		it '掲示板一覧が表示されること' do
			expect(page).to have_content '掲示板一覧'
		end
	
		it '特定の記事の名前が表示されていること' do
			expect(page).to have_content board.name
		end
	
		it '特定の記事のタイトル名が表示されていること' do
			expect(page).to have_content board.title
		end
	end
end