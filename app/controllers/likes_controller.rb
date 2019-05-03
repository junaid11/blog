class LikesController < ApplicationController
  respond_to :js, :html
  before_action :fetch_resource

  def create
    @like = @resource.likes.create(user_id: current_user.id) if exist?(@resource)
  end

  def destroy
    @like = @resource.likes.where(user: current_user).delete_all
  end

  private

  def fetch_resource
    @resource = if %w[post comment].include? params[:resource_name]
                  params[:resource_name].classify.constantize.find(params[:resource_id])
                end
  end

  def exist?(resource)
    resource.likes.find_by(user: current_user).nil?
  end
end
