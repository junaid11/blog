module ReportsHelper
  def resource_report(resource)
    resource.reports.find { |report| report.user_id == current_user.id }
  end
end
