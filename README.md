## Pennode app

> A Blog app that will show the list of posts and empower readers to interact with them by adding comments and liking posts.
> Share your experiences and stories with the cosmos of the pennoders
![image](https://user-images.githubusercontent.com/94127418/187267474-616e7755-adcc-4d5f-b85f-dc2e36283d5d.png)

![image](https://user-images.githubusercontent.com/94127418/187267006-ecbf6468-bef3-4c15-ab4a-66d21da494b1.png)

![image](https://user-images.githubusercontent.com/94127418/187266731-16d90317-1400-4123-957a-2e2edb743157.png)
#### NOTE: Still underconstruction


### Built With

- Ruby on Rails
- Development set up
- Clone Repository using HTTPS
- Devise for authentication
- CanCan for authorization

> git clone https://github.com/kinginthenorthcodez/pennode

- Move into project directory

> cd pennode

### Available Scripts

> bundle install rails server

### Available Scripts to Run Test cases

> Run following command gem install --no-document rspec -v '>=3.0, < 4.0' > rspec --force-color --format documentation
> Uses `gem 'rspec-rails' ` `gem 'shoulda-matchers' ` tests framworks.

### [Ruby on Rails Testing](https://guides.rubyonrails.org/v2.3/testing.html)

### Preparing your Application for Testing

- Before you can run your tests you need to ensure that the test database structure is current. For this you can use the following rake commands:

`$ rake db:migrate`
...
` $ rake db:test:load`

- Above rake db:migrate runs any pending migrations on the developemnt environment and updates db/schema.rb. rake db:test:load recreates the test database from the current db/schema.rb. On subsequent attempts it is a good to first run db:test:prepare as it first checks for pending migrations and warns you appropriately.

### Tests using Rspec

- `rails db:test:prepare`
- `rake db:migrate`

### Author

👤 kinginthenorthcodez

GitHub: @kinginthenorthcodez
🤝 Contributing

### Contributions, issues, and feature requests are welcome!

- Feel free to check the issues page.
  https://github.com/kinginthenorthcodez/pennode/issues

### Show your support

Give a ⭐️ if you like this project!

📝 License
This project is MIT licensed.
