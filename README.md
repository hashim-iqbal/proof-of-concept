## Dependencies
- Ruby 2.7.1
- Rails 6.0.4.1
- SQlite
- Yarn
- Webpacker
- ChartKick
- Bootstrap
​

## To setup project
- Install deps using `bundle install` & `yarn install`
- Setup DB using `rails db:setup`
- Run these rake tasks to populate DB `rails import:users` & `rails import:events`
- Run `rails s` at project root, fire up the browser and go to `localhost:3000`
​

## Specs
- For rails specs `rspec`
​​

## Links
* [Demo](https://reports-sales.herokuapp.com/)
​

## Explanations
- No authentication to keep things simple
- Added Model specs only
- Given more time I can improve UI, add specs coverage and add pagination
