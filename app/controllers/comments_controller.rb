class CommentsController < ApplicationController
  before_action :comment_params, only: %i[create]
  before_action :fetch_post
  respond_to :js

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    @comment.save
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    authorize! :destroy, @comment
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :parent_id, :avatar)
  end

  def fetch_post
    @post = Post.find(params[:post_id])
  end
end
