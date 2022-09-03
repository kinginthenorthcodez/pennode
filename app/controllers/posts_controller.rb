class PostsController < ApplicationController
  before_action :require_permision, only: %i[edit update destroy]


  def index
    @posts = Post.all.includes(:user, comments: [:user]) # eager loading..
    @user = User.find_by(id: params[:user_id])
  end

  def show
    @post = Post.includes(comments: [:user]).find_by(id: params[:id]) # eager loading..
    @user = User.find_by(id: params[:user_id])
  end

  def new
    post = Post.new
    @user = current_user
    respond_to do |format|
      format.html do
        render :new, locals: { post:, current_user: @user }
      end
    end
  end

  def create
    data = post_params
    @current_user = current_user
    post = Post.new(user_id: current_user.id, title: data[:title], text: data[:text], comments_counter: 0,
                    likes_counter: 0)
    if post.save
      flash[:success] = 'Post successfully created!'
      redirect_to user_path(current_user)
    else
      flash.now[:error] = 'Error: Post could not be created!'
      render :new, locals: { post:, current_user: }
    end
  end

  def edit
    post = Post.find(params[:id])
    @user = current_user
    respond_to do |format|
      format.html do
        render :edit, locals: { post:, current_user: @user }
      end
    end
  end

  def update
    data = post_params
    @current_user = current_user
    post = Post.find_by(id: params[:id])
    respond_to do |format|
      format.html do
        if post.update(user_id: current_user.id, title: data[:title], text: data[:text],
                       comments_counter: post.comments_counter,
                       likes_counter: post.likes_counter)
          flash[:success] = 'Post updated successfully!'
          redirect_to user_posts_path(current_user)
        else
          flash.now[:error] = 'Error: Update failed!'
          render :edit, locals: { post:, current_user: }
        end
      end
    end
  end

  def destroy
    post = Post.find_by(id: params[:id])
    if post.destroy
      respond_to do |format|
        format.html do
          flash[:success] = 'Post deleted successfully!'
          redirect_to user_posts_path
        end
      end
    else
      flash.now[:error] = 'Error: Delete failed!'
    end
  end

  private

  def require_permision
    if Post.find(params[:id]).user == current_user
      nil
    else
      redirect_to user_posts_path, flash: { error: 'You dont have permission to do that!' }
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
