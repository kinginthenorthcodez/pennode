class Post < ApplicationRecord
  validates :title, presence: true, length: { in: 1..250 }
  validates :comments_counter, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, comparison: { greater_than_or_equal_to: 0 }

  belongs_to :user

  has_many :likes
  has_many :comments

  after_create :update_post_counter

  def update_post_counter
    user.update(posts_counter: (user.posts_counter || 0) + 1)
  end

  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
