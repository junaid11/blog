module ReviewReportsHelper
  def find_post(report)
    Post.find(report.reportable_id)
  end

  def find_comment(report)
    Comment.find(report.reportable_id)
  end
end
