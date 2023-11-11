require 'rails_helper'

RSpec.describe "Boards", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:board_1) { create(:board, title: "Ruby 1", body: "Content 1", user: user) }
  let(:board_2) { create(:board, title: "Ruby 2", body: "Content 2", user: user) }
  let(:board_3) { create(:board, title: "Ruby 3", body: "Content 3", user: user) }
  let(:board_4) { create(:board, title: "Ruby 4", body: "Content 4", user: user) }
  let(:board_5) { create(:board, title: "Ruby 5", body: "Content 5", user: user) }
  before do
    user
    board_1
    board_2
    board_3
    board_4
    board_5
  end
  
  describe 'GET #index' do
    context 'indexページに遷移する場合' do
      before do
        get boards_path, as: :json # JSON形式でリクエスト
      end

      it "200 httpレスポンスを返す" do
        expect(response.status).to eq 200
      end
      
      it "掲示板が5件返る" do
        json_response = JSON.parse(response.body)
        expect(json_response.length).to eq(5)
      end

      it "5件の掲示板が正確に返る" do
        json_response = JSON.parse(response.body)
        expected_boards = [board_1, board_2, board_3, board_4, board_5]
  
        transformed_response = json_response.map do |board|
          {
            id: board['id'],
            title: board['title'],
            body: board['body']
          }
        end

        expected_data = expected_boards.map do |board|
          {
            id: board.id,
            title: board.title,
            body: board.body
          }
        end
        expect(transformed_response).to eq(expected_data)
      end
    end
  end
end
