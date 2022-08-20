require 'rails_helper'

RSpec.describe Like, type: :model do
  user1 = User.new(name: 'Professor1',
                   photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                   bio: 'My name is Professor1.',
                   posts_counter: nil)

  post1 = Post.new(user: user1,
                   title: 'Hello',
                   text: 'This is my first post',
                   comments_counter: nil,
                   likes_counter: nil)

  subject { described_class.new(user: user1, post: post1) }

  describe ' Validations' do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:post) }
  end
  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end
end
