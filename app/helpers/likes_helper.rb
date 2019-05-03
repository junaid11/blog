module LikesHelper
  def resource_like(resource)
    resource.likes.find { |like| like.user_id == current_user.id }
  end
end
