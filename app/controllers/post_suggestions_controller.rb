class PostSuggestionsController < ApplicationController
  before_action :fetch_post, only: %i[create destroy]
  before_action :suggestion_params, only: %i[create]

  def create
    @suggestion = @post.suggestions.build(suggestion_params)
    @suggestion.user = current_user
    @suggestion.save

    redirect_to @post
  end

  def destroy
    @suggestion = @post.suggestions.find(params[:id])
    @suggestion.destroy

    redirect_back fallback_location: root_path
  end

  def index
    @posts = Post.where(user_id: current_user)
  end

  private

  def suggestion_params
    params.require(:suggestion).permit(:body, :reference_text)
  end

  def fetch_post
    @post = Post.find(params[:post_id])
  end
end
