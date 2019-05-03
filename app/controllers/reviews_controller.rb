class ReviewsController < ApplicationController
  load_and_authorize_resource :post

  def index
    @posts = Post.unapproved
  end

  def update
    @post = Post.find(params[:id])
    @post.approve

    redirect_to reviews_path
  end
end
