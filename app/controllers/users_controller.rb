class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = Post.find_by(id: params[:id])
  end

  def create; end

  private

  def user_params
    params.permit(:id)
  end
end
