class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @post = Post.find_by(id: params[:id])
    @current_user_posts = Post.where(user_id: params[:id]).includes(:user)
  end

  def create; end

  private

  def user_params
    params.require(:user).permit(:name, :photo, :bio)
  end
end
