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
    post = Post.new(user_id: @current_user.id, title: data[:title], text: data[:text], comments_counter: 0,
                    likes_counter: 0)
    if post.save
      flash[:success] = 'Post successfully created!'
      redirect_to user_path(@current_user)
    else
      flash.now[:error] = 'Error: Post could not be created!'
      render :new, locals: { post:, current_user: }
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
