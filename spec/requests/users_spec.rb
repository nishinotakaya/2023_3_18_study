require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:fixed_created_at) { Time.zone.parse("2023-11-11") }
  let(:fixed_updated_at) { Time.zone.parse("2023-11-11") }
  let(:dummy_password_digest) { "dummy_password_digest" }

  let(:user_1) { create(:user, name: "takaya 1", email: "email@email.com", password_digest: dummy_password_digest, created_at: fixed_created_at, updated_at: fixed_updated_at) }
  let(:user_2) { create(:user, name: "takaya 2", email: "email2@email.com", password_digest: dummy_password_digest, created_at: fixed_created_at, updated_at: fixed_updated_at) }
  let(:user_3) { create(:user, name: "takaya 3", email: "email3@email.com", password_digest: dummy_password_digest, created_at: fixed_created_at, updated_at: fixed_updated_at) }
  let(:user_4) { create(:user, name: "takaya 4", email: "email4@email.com", password_digest: dummy_password_digest, created_at: fixed_created_at, updated_at: fixed_updated_at) }
  let(:user_5) { create(:user, name: "takaya 5", email: "email5@email.com", password_digest: dummy_password_digest, created_at: fixed_created_at, updated_at: fixed_updated_at) }

  describe 'GET #index' do
    before do
      user_1
      user_2
      user_3
      user_4
      user_5
    end
    context 'indexページに遷移する場合' do
      before do
        get users_path, as: :json # JSON形式でリクエスト
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
        expected_users = [user_1, user_2, user_3, user_4, user_5]
  
        transformed_response = json_response.map do |user|
          {
            id: user['id'],
            name: user['name'],
            email: user['email']
          }
        end

        expected_data = expected_users.map do |user|
          {
            id: user.id,
            name: user.name,
            email: user.email
          }
        end
        expect(transformed_response).to eq(expected_data)
      end
    end
  end
  describe 'GET #show' do
    before do
      user_1
      get user_path(user_1), as: :json
    end

    it "200 httpレスポンスを返す" do
      expect(response.status).to eq 200
    end

    it '指定されたユーザーの詳細が返る' do
      json_response = JSON.parse(response.body)
      expected_data = {
        'id' => user_1.id,
        'name' => user_1.name,
        'email' => user_1.email,
        'created_at' => user_1.created_at.as_json,
        'updated_at' => user_1.updated_at.as_json,
        "password_digest" => user_1.password_digest
      }
      expect(json_response).to eq(expected_data)
    end
  end
end
