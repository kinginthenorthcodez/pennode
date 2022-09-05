require 'rails_helper'

RSpec.describe Post, type: :model do
  user1 = User.new(name: 'Professor1',
                   photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                   bio: 'My name is Professor1.',
                   posts_counter: nil)

  subject do
    described_class.new(user: user1,
                        title: 'Hello',
                        text: 'This is my first post',
                        comments_counter: nil,
                        likes_counter: nil)
  end

  describe 'Validations' do
    it 'Title must not be blank' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'Title must not exceed 250 characters.' do
      subject.title = 'hello' * 100
      expect(subject).to_not be_valid
    end

    it 'CommentsCounter must be an integer greater than or equal to zero' do
      subject.comments_counter = nil
      expect(subject).to_not be_valid
    end

    it 'LikesCounter must be an integer greater than or equal to zero.' do
      subject.likes_counter = nil
      expect(subject).to_not be_valid
    end

    it 'updates post counter' do
      subject.update_post_counter
      expect(user1.posts_counter).to eq 1
    end
  end

  describe 'Associations' do
    it { should belong_to(:user).without_validating_presence }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end
end
