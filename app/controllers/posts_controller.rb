class PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: params[:user_id])
    @user = User.find_by(id: params[:user_id])
    @post_comments = Comment.all
    @post_users = User.all
  end

  def show
    @values = params
    @post = Post.find_by(user_id: params[:user_id], id: params[:id])
    @user = User.find_by(id: params[:user_id])
    @post_users = User.all
    @post_comments = Comment.all
  end
end
