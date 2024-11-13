class PostsController < ApplicationController
  def index
    if params[:user_id]
      @user = User.includes(:posts).find(params[:user_id])
      @posts = @user.posts
    else
      @posts = Post.all.includes(:user)
    end
  end

  def show
    @user = User.includes(:posts).find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comments = @post.comments.all
    @like = @post.likes.new(user_id: current_user.id)
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      current_user.increment!(:posts_counter)
      redirect_to user_posts_path, notice: 'Post was successfully created'
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to user_posts_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    if @post.destroy
      redirect_to user_posts_path(@user), alert: 'Post successfully deleted'
    else
      redirect_to user_posts_path(@user), alert: 'Post could not be deleted'
    end
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
