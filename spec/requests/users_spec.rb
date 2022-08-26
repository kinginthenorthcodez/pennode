require 'rails_helper'

RSpec.describe UsersController, type: :request do
  context 'Get all users' do
    before(:each) do
      get users_path
    end
    it 'Assigns all users to @users' do
      expect(assigns(:users)).to eq(User.all)
    end
    it 'It renders the users template' do
      expect(response).to render_template('index')
    end
    it 'Responds with ok status' do
      expect(response).to have_http_status(:ok)
    end
    it 'Responds to html by default' do
      expect(response.content_type).to eq 'text/html; charset=utf-8'
    end
    it 'Body includes Pennode Users' do
      expect(response.body).to include('Pennode Users')
    end
  end

  context 'Get Singel user' do
    before(:each) do
      get(user_path(id: 1))
    end
    it 'Assigns user to @user' do
      expect(assigns(:user)).to eq(User.find_by(id: 1))
    end

    it 'It renders the single user template' do
      expect(response).to render_template('show')
    end
    it 'Body includes User Profile' do
      expect(response.body).to include('User Profile')
    end
  end
end
