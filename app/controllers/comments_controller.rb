class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @user = User.find_by(id: params[:user_id])
    @post = Post.find_by(id: params[:post_id])
    @comments = Comment.where(post_id: params[:post_id]).includes(:user)
  end

  def create
    data = comment_params
    if user_signed_in?
      @current_user = current_user
      comment = Comment.new(post_id: params[:post_id], user_id: @current_user.id, text: data[:text])
      if comment.save
        flash[:success] = 'Comment successfully created!'
        redirect_to new_user_post_comment_path(user_id: params[:user_id], id: params[:post_id])
      else
        flash[:error] = 'Error: comment could not be created!'
        redirect_to new_user_post_comment_path
      end
    else
      flash[:error] = 'You need to sign in to comment!'
      redirect_to new_user_post_comment_path
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.destroy
      flash[:success] = 'Comment Successfully deleted!'
    else
      flash.now[:error] = 'Error: could not delete comment!'
    end
    redirect_to user_post_path(id: params[:post_id])
  end

  private

  def require_permision_create
    if user_signed_in?
      flash.now[:success] = "Thnaks #{current_user.name}"
    else
      redirect_to new_user_post_comment_path, flash: { error: 'Sign in to leave a comment!!' }
    end
  end

  def require_permision_delete
    if Comment.find(params[:id]).user == current_user
      { confirm: 'Are you sure' }
    else
      redirect_to user_posts_path(id: params[:post_id]), flash: { error: 'You dont have permission to do that!' }
    end
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
