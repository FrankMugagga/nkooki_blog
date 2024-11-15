class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = if params[:search].present?
               User.where('first_name ILIKE ? OR last_name ILIKE ?', "%#{params[:search]}%", "%#{params[:search]}%")
             else
               User.all
             end
  end

  def show
    @user = User.find_by(id: params[:id])
    if @user.nil?
      redirect_to users_path, alert: 'user not found'
    else
      @user_posts = @user.posts.includes(:user).limit(3)
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, alert: 'User successfully deleted'
  end

  private

  def user_params
    params.require(:user).permit(:first_name, last_name, photo, bio, posts_counter, twitter, phone, email, password,
                                 image)
  end
end
