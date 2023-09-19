require 'rails_helper'

RSpec.describe "Boards", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let!(:boards) { create_list(:board, 5, user: user) }
  before do
    user
    boards
  end
  
  describe 'GET #index' do
    context 'indexページに遷移する場合' do
      before do
        get boards_path
      end

      it "200 httpレスポンスを返す" do
        expect(response.status).to eq 200
      end

      it "indexページが表示される" do
        expect(response).to render_template :index
      end
    end
  end
end
