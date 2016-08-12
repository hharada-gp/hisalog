class HomeController < ApplicationController
  before_action :check_login

  def index
    @articles = Article.limit(5).order('created_at DESC')
    @categories = Category.limit(5)
    @comments = Comment.limit(5).order('created_at DESC')
    @users = User.limit(5)
  end
end