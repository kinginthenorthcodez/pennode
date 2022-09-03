class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :name, presence: true, allow_blank: false
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }

  has_many :posts, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  ROLES = %i[admin moderator author banned].freeze

  def most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def is?(requested_role)
    role == requested_role.to_s
  end
end
