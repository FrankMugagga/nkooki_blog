class CommentsController < ApplicationController
  def new
    @user = User.includes(:posts).find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @user = User.includes(:posts).find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      @post.increment!(:comments_counter)
      redirect_to user_post_path(@user, @post), notice: 'Comment was successfully created'
    else
      render :new
    end
  end

  def destroy
    # You can implement destroy action if needed
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
