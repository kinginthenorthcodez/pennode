require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(name: 'Professor1',
                        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'My name is Professor1.',
                        posts_counter: nil)
  end

  describe 'Validations' do
    it 'name must not be blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it 'PostsCounter must be an integer greater than or equal to zero.' do
      subject.posts_counter = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'Associations' do
    it { should have_many(:posts) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end
end
