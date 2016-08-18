class UsersController < ApplicationController
  before_action :check_login
  before_action :default_blog_setting

  def index
    force_login

    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to auth_mypage_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    force_login

    @user = User.find(params[:id])
  end

  def update
    force_login

    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    force_login

    @user = User.find(params[:id])
    if @current_user == @user
      reset_user_session
      @user.destroy
      redirect_to root_path
    else
      @user.destroy
      redirect_to users_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
