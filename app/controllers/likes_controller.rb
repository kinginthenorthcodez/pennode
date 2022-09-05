class LikesController < ApplicationController
  def create
    data = likes_params
    @like = current_user.likes.new(user_id: data[:user_id], post_id: data[:post_id])
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
