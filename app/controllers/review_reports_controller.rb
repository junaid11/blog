class ReviewReportsController < ApplicationController
  load_and_authorize_resource :report

  def index
    @reports = Report.all
  end
end
