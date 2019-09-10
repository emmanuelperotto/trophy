# Dependencies
- Ruby 2.6.3
- Rails 6.0
- PostgreSQL

# Tools Used
- Command Design Pattern to get all the reward giving logic centralized
- [RSpec](https://rspec.info/) for tests
- [Devise](https://github.com/plataformatec/devise) for authentication
- [Rails Admin](https://github.com/sferik/rails_admin) for the dashboard
- [Rubocop](https://github.com/rubocop-hq/rubocop) for static code analysis
- [Heroku](https://www.heroku.com/) as Cloud to host the application

# How to run (heroku)
- Access https://guarded-brook-06687.herokuapp.com (it can take a little time in the first loading because i'm using the free heroku plan)
- If you don't have an account then you can click sign up

# How to run (locally)

- After cloning run ```bundle install```
- Run ```rails db:create db:migrate db:seed```
- Run ```rails s``` and then go to localhost:3000
- If you don't have an account then you can click sign up
