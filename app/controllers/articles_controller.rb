class ArticlesController < ApplicationController
  def index
    @articles = Article.order('created_at DESC')
  end

  def new
    @article = Article.new
    @categories = Category.all
  end

  def create
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
    @article = Article.find(params[:id])
    @categories = Category.all
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      redirect_to @article
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :content, :category_id)
    end
end
