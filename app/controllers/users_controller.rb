class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @current_user_posts = current_user.posts
  end

  def create; end

  private

  def user_params
    params.require(:user).permit(:name, :photo, :bio, :role)
  end
end
