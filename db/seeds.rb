# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

if User.count.zero?
  first_user = User.create(name: 'Maqueen', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',posts_counter:0, email: 'isaacmaqueen1@gmail.com', role: 'admin',password: 'test123')
  second_user = User.create(name: 'Jerry', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.',posts_counter:0, email: 'jerry@gmail.com', role: 'author', password: 'test123')

  #Create at least 4 posts written by one of the users you created by running the following code
  4.times do |i|
     Post.create(user: first_user, title: "Welcome to My #{i} Post", text: "This is my #{i} post",comments_counter:0,likes_counter:0)
  end

  first_post = Post.take
  #Create at least 6 posts comments for one of the posts you created by running the following code:
  6.times do |i|
    Comment.create(post: first_post, user: second_user, text: "Hi Tom! this is my #{i} comment" )
  end
end
# if there is no OAuth application created, create them
if Doorkeeper::Application.count.zero?
  Doorkeeper::Application.create(name: "iOS client", redirect_uri: "", scopes: "")
  Doorkeeper::Application.create(name: "Android client", redirect_uri: "", scopes: "")
  Doorkeeper::Application.create(name: "Web client rails", redirect_uri: "", scopes: "")
end