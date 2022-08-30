require 'rails_helper'

RSpec.describe 'User pages functionality: User index page ', type: :feature do
  let!(:user) do
    User.create(name: 'Maqueen', photo: 'https://media.istockphoto.com/vectors/default-profile-picture-avatar-photo-placeholder-vector-illustration-vector-id1223671392?k=20&m=1223671392&s=612x612&w=0&h=lGpj2vWAI3WUT1JeJWm1PRoHT3V15_1pdcTn2szdwQ0=',
                bio: 'Programer in headquaters', posts_counter: 0)
  end

  it 'signs @user / in home ' do
    visit '/'
    expect(current_path).to eq(root_path)
  end

  it 'signs @user /users/ in home' do
    visit '/users'
    expect(current_path).to eq(users_path)
  end

  it 'I can see the username of all other users.' do
    visit users_path
    expect(page).to have_text(user.name)
  end

  it 'I can see the number of posts each user has written.' do
    visit users_path
    expect(page).to have_text(/posts: #{user.posts_counter}/i)
  end
  it 'I can see the profile picture for each user' do
    visit users_path
    expect(page).to have_xpath("//img[@src ='#{user.photo}']")
  end

  it ' Returns name maqeen' do
    visit users_path
    expect(user.reload.name).to eq('Maqueen')
  end

  it "When I click on a user, I am redirected to that user's show page' " do
    visit users_path
    click_on user.name
    expect(page).to have_current_path(user_path(user))
  end

  it 'has one user on users' do
    visit users_path
    expect(all('div.grid-container').length).to eq(1)
  end
end
