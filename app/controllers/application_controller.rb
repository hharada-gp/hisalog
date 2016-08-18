class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def reset_user_session
    session[:user_id] = nil
    @current_user = nil
  end

  def force_login
    check_login
    unless @current_user
      redirect_to auth_login_path
    end
  end

  def check_login
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def default_blog_setting
    @setting = Setting.find_or_create_by(id: 1)
  end
end
