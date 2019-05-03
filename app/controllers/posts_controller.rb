class PostsController < ApplicationController
  before_action :post_params, only: %i[create]
  before_action :fetch_post, only: %i[show destroy edit update]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to posts_path, notice: 'This Post Move for Approval'
    else
      render 'new'
    end
  end

  def index
    @posts = Post.approved
  end

  def destroy
    authorize! :destroy, @post

    @post.destroy
    redirect_back fallback_location: root_path
  end

  def edit
    authorize! :edit, @post
  end

  def update
    authorize! :update, @post
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def show; end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def fetch_post
    @post = Post.find(params[:id])
  end
end
