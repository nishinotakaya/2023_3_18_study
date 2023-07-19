RSpec.describe UsersController, type: :controller do
  before do
    @user = create(:user)
  end

  describe 'GET #index' do
    it '全てのユーザーが表示される' do
      get :index
      expect(assigns(:users)).to match_array(User.all)
    end
  end
  describe 'GET #show' do
    context '該当のユーザーが表示される場合' do
      before do
        @user = create(:user)
        get :show, params: { id: @user.id } # @userのidが含まれるpathにリクエストを送信します。
      end
  
      it '200 httpレスポンスを返す' do
        expect(response.status).to eq 200
      end
  
      it '該当のユーザーが表示される' do
        expect(assigns(:user)).to eq @user
      end
    end
  end  
end
