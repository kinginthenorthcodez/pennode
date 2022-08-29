class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(likes_params)
    post = @like.post
    user = post.user
    if like.save
      flash[:success] = 'Liked!'
      redirect_to user_post_path(user, post)
    else
      flash.now[:error] = 'Error: Cant Like!'
    end
  end

  def destroy
    @like = current_user.likes.find_by(params[:id])
    post = @like.post
    @like.destroy
    redirect_to user_post_path(post.user, post)
  end

  private

  def likes_params
    params.require(:like).permit(:user_id, :post_id)
  end
end
