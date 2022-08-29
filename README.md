## Pennode app

> A Blog app that will show the list of posts and empower readers to interact with them by adding comments and liking posts.
> Share your experiences and stories with the cosmos of the pennoders
image.png
image.png
image.png
image.png
image.png

### Built With

- Ruby on Rails
- Development set up
- Clone Repository using HTTPS

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
