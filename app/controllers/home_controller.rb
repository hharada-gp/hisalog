class HomeController < ApplicationController
 def index
  @articles = Article.order('created_at DESC')
  @categories = Category.all
  @comments = Comment.order('created_at DESC')
 end
end