class AuthController < ApplicationController
  before_action :default_blog_setting

  def index
    redirect_to auth_login_path
  end

  def login
    if session[:user_id]
      redirect_to auth_mypage_path
    end
  end

  def create
    # render text: params[:user][:name]
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to auth_mypage_path
    else
      flash.now[:error] = true
      render :login
    end
  end

  def mypage
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      @current_user_name = @current_user.name
    else
      redirect_to auth_login_path
    end
  end

  def logout
    reset_session
  end
end
