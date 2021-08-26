class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user

  private

  def current_user
    return unless session[:user_id] #セッションにuser_idが存在しない。ログインされてない事を意味する
    @current_user = User.find_by(id: session[:user_id]) #現在ログイン中のuser
  end  
end
