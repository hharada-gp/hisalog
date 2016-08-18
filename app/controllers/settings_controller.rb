class SettingsController < ApplicationController
  before_action :check_login
  before_action :default_blog_setting

  def index
    force_login
  end

  def edit
    force_login
    @setting = Setting.find(1)
  end

  def update
    force_login
    @setting = Setting.find(1)
    if @setting.update(setting_params)
      redirect_to settings_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    redirect_to settings_path
  end

  private
    def setting_params
      params.require(:setting).permit(:title, :description)
    end
end