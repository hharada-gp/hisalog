class ArticlesController < ApplicationController
  before_action :check_login

  def index
    @articles = Article.page(1).per(5)
  end

  def new
    force_login

    @article = Article.new
    @categories = Category.all
  end

  def create
    force_login

    @categories = Category.all
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @article = Article.find(params[:id])
    @comment = @article.comments.build()
    @comments = @article.comments.all
  end

  def edit
    force_login

    @article = Article.find(params[:id])
    @categories = Category.all
  end

  def update
    force_login

    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      redirect_to @article
    end
  end

  def destroy
    force_login

    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :content, :category_id)
    end
end
