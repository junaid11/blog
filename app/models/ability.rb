class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :moderator
      can :manage, Post
      can :manage, Comment
      can :manage, Report
      can :manage, Suggestion
    elsif user.has_role? :user
      can :update, Post do |post|
        post.user == user
      end

      can :destroy, Post do |post|
        post.user == user
      end

      can :destroy, Comment do |comment|
        comment.user == user
      end
    end
  end
end
