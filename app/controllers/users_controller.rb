class UsersController < ApplicationController

  def index
    @users = User.all

    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  def new
    @user = User.new(flash[:user]) #入力されたuser名が消えずに残る
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id #セッション情報のアクセスしてきたuserセッション情報を扱う特殊なキーuser.idを入れる
      redirect_to mypage_path
    else
      redirect_to new_user_url, flash: {
        user: user,
        error_messages: user.errors.full_messages
      }
    end
  end

  def me
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end  

end
