# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
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

