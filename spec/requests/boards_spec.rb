require "rails_helper"

RSpec.describe 'Boards', type: :system do

	describe "記事一覧に遷移" do
		let(:user) { FactoryBot.create(:user) }
		let(:article) { FactoryBot.create(:article, title: 'Rubyについて', subtitle: 'Ruby') }
	
		context 'ログイン後に記事一覧に遷移' do
			before do
				visit login_path
				fill_in 'Email', with: user.email
				fill_in 'Password', with: user.password
				click_button 'ログイン'
				visit articles_path  # 記事一覧ページへ遷移
			end
		end
	
		it '記事一覧が表示されること' do
			expect(page).to have_content '記事一覧'
		end
	
		it '特定の記事のタイトル名が表示されていること' do
			expect(page).to have_content article.title
		end
	
		it '特定の記事のサブタイトル名が表示されていること' do
			expect(page).to have_content article.subtitle
		end
	end