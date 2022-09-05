class Api::V1::CommentsController < Api::V1::ApplicationController
  def index
    @comments = Comment.where(user_id: params[:user_id], post_id: params[:post_id])
    render json: @comments
  end

  def create
    data = comment_params
    comment = Comment.new(user_id: current_user.id, post_id: params[:post_id], text: data[:text])
    if comment.save
      render json: 'Comment Successfully created!'
    else
      render json: 'Error: Commnent faild!'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
