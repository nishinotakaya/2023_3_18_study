class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:session][:name])#引数で条件にマッチするか
    if user && user.authenticate(params[:session][:password]) #authenticateはuser名とパスワードがマッチされているか？find_byでとったものがparams~マッチしているか？
      session[:user_id] = user.id
      redirect_to boards_path
    else
      render 'home/index'
    end    
  end

  def destory
    session.delete(:user_id)
    redirect_to root_path
  end
end
