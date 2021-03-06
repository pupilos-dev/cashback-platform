# CashBack Platform
This is a web platform that displays offers to Members, offers created by administrators.
Members are able to choose the best offer and shop in order to receive cashback.

### Ruby version
```
2.7.1
```

### Rails version
```
6.0.3
```

### Configuration
```shell
bundle install
yarn install
```

### Database creation
```shell
bundle exec rails db:setup
or
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed
```

### How to run the test suite
```shell
bundle exec rspec
```

### Run the server
```shell
bundle exec rails server
```

## Documentation

An offer has two states: enabled and disabled:
- `created`: disabled.
- `current time >= starts_at`: enabled.
- `current time =< ends_at`: disabled.
- `end_at` is blank: disabled.
- `disabled button` active: disabled.

An offer has three actions:
- disable/enable
- edit
- destroy

Member Account
```
email: 'lemoney@member.com'
password: 'password'
```

Admin Account
```
email: 'lemoney@admin.com'
password: 'password'
```

Home Page: `localhost:3000`

Only enabled offers are displayed, premium appear on top.

Create Offers: `http://localhost:3000/offers`

Offers creation dashboard.

Create Member: `http://localhost:3000/members/sign_up`
Login Member: `http://localhost:3000/members/sign_in`

