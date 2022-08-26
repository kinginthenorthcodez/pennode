require 'rails_helper'

RSpec.describe PostsController, type: :request do
  context 'Get all posts' do
    before(:each) do
      get user_posts_path(user_id: 1)
    end
    it 'Assigns all posts to @posts' do
      expect(assigns(:posts)).to eq(Post.where(user_id: 1))
    end
    it 'It renders the Posts template' do
      expect(response).to render_template('index')
    end
    it 'Responds with ok status' do
      expect(response).to have_http_status(:ok)
    end
    it 'Responds to html by default' do
      expect(response.content_type).to eq 'text/html; charset=utf-8'
    end
    it 'Body includes User Posts' do
      expect(response.body).to include('User Posts')
    end
  end

  context 'Get Singel Post' do
    before(:each) do
      get(user_post_path(user_id: 1, id: 2))
    end
    it 'Assigns post to @post' do
      expect(assigns(:post)).to eq(Post.find_by(user_id: 1, id: 2))
    end

    it 'It renders the single post template' do
      expect(response).to render_template('show')
    end
    it 'Body includes User Post' do
      expect(response.body).to include('User Post')
    end
  end
end
