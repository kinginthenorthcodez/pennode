class Like < ApplicationRecord
  validates_presence_of :user
  validates_presence_of :post

  belongs_to :user
  belongs_to :post

  after_create :update_likes_counter

  def update_likes_counter
    post.update(likes_counter: (post.likes_counter || 0) + 1)
  end
end
