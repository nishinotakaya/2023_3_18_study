RSpec.describe "Boards", type: :request do
  # 問題2
  before do
    @user = create(:user)
    @boards = create_list(:board, 5, user: @user) # 5つのボードを作成します。
    @board = create(:board, user: @user) # ボードを作成します。
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
#↓新規追加＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
  describe 'GET show' do 
    it "200httpレスポンスを返す" do
      get board_path(@board)
      expect(response.status).to eq 200
    end

    it "showページが表示される" do
      get board_path(@board)
      expect(response).to render_template :show
    end
  end

  # ＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
  # 問題1 回答
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
