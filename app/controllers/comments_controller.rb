class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @user = User.find_by(id: params[:user_id])
    @post = Post.find_by(user_id: params[:user_id], id: params[:id])
    @comments = Comment.where(post_id: params[:id])
  end

  def create
    data = comment_params
    @current_user = current_user
    comment = Comment.new(post_id: params[:post_id], user_id: @current_user.id, text: data[:text])
    if comment.save
      flash[:success] = 'Comment successfully created!'
      redirect_to user_post_path(id: params[:post_id])
    else
      flash.now[:error] = 'Error: comment could not be created!'
      redirect_to new_user_post_comment
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
