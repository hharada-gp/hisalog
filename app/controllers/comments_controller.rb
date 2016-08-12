class CommentsController < ApplicationController
  def index
    redirect_to home_index_path
  end

  def new
    @comment = Comment.new
    @comments = @comment.article.comments.all
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to @comment.article
    else
      @comments = @comment.article.comments.all
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    force_login

    @comment = Comment.find(params[:id])
  end

  def update
    force_login

    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to @comment.article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    force_login

    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to @comment.article
  end

  private
    def comment_params
      params.require(:comment).permit(:name, :content, :article_id)
    end
end
