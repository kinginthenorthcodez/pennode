class Api::V1::PostsController < Api::V1::ApplicationController
  # before_action :authenticate_user!

  def index
    @posts = Post.where(user_id: params[:user_id])
    render json: @posts
  end

  def show
    @post = Post.find_by(id: params[:id])
    render json: @post
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
