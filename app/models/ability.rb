class Ability
  include CanCan::Ability
end

# app/models/ability.rb
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.admin?
      # Admins can do anything
      can :manage, :all
    else
      # A logged-in user can manage their own resources
      can :manage, Post, user_id: user.id
      can :manage, Comment, user_id: user.id
      can :manage, Like, user_id: user.id

      # A user can view other users' posts, comments, and likes (read-only access)
      can :read, Post
      can :read, Comment
      can :read, Like

      # Users can like posts, even if they are not the owner
      can :create, Like

      # Custom rule: a user can only update or destroy their own comments
      can :update, Comment, user_id: user.id
      can :destroy, Comment, user_id: user.id

      # Example of a user can only delete their own likes
      can :destroy, Like, user_id: user.id
    end
  end
end
