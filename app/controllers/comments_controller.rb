class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    if @comment.save
      redirect_to article_path(@comment.article)
      flash[:success] = "Comment successfully posted"
    else
      render 'new'
    end
  end

  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end
end
