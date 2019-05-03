class ReportsController < ApplicationController
  respond_to :js, :html
  before_action :fetch_resource

  def create
    @report = @resource.reports.create(user_id: current_user.id)
  end

  def destroy
    @report = @resource.reports.where(user: current_user).delete_all
  end

  private

  def fetch_resource
    @resource = if %w[post comment].include? params[:resource_name]
                  params[:resource_name].classify.constantize.find(params[:resource_id])
                end
  end
end
