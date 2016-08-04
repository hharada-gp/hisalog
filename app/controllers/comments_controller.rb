class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @allComments = @comment.article.comments.all
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to @comment.article
    else
      @allComments = @comment.article.comments.all
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to @comment.article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to @comment.article
  end

  private
    def comment_params
      params.require(:comment).permit(:name, :content, :article_id)
    end
end
