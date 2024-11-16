class LikesController < ApplicationController
  def create
    @user = User.includes(:posts).find(params[:user_id])
    @post = @user.posts.find(params[:post_id])

    if @post.likes.exists?(user_id: current_user.id)
      flash[:alert] = 'post already liked'
    else
      @like = @post.likes.create(user_id: current_user.id)
      @post.increment!(:likes)
      redirect_to user_post_path(@user.id, @post.id), notice: 'Like was successfully created'
    end
  end
end
