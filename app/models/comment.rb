class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :update_comment_counter

  def update_comment_counter
    post.update(comments_counter: (post.comments_counter || 0) + 1)
  end
end
