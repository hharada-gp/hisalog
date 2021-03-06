class CategoriesController < ApplicationController
  before_action :check_login
  before_action :default_blog_setting

  def index
    @categories = Category.all
  end

  def new
    force_login

    @category = Category.new
  end

  def create
    force_login

    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @category = Category.find(params[:id])
    @allArticlesInTheCategory = @category.articles.all
  end

  def edit
    force_login

    @category = Category.find(params[:id])
  end

  def update
    force_login

    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to categories_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    force_login

    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
