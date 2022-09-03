# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',posts_counter:0, email: 'tom@gamil.com', password: 'test123')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.',posts_counter:0, email: 'jerry@gamil.com', password: 'test123')

#Create at least 4 posts written by one of the users you created by running the following code
4.times do |i|
   Post.create(user: first_user, title: "Welcome to My #{i} Post", text: "This is my #{i} post",comments_counter:0,likes_counter:0)
end

first_post = Post.take
#Create at least 6 posts comments for one of the posts you created by running the following code:
6.times do |i|
  Comment.create(post: first_post, user: second_user, text: "Hi Tom! this is my #{i} comment" )
end
