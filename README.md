# Pokemon API

## Description

This is a restful API for the pokemon universe

## Technologies and versions

- Rails(5.2.3)
- Ruby(2.6.3)
- PostgreSQL v11.2 or greater
- Rspec v3.8
- Rubocop v0.73.0

## Installation Process

### Define ruby gemset

If using RVM, be sure to set up your gemset:
Do this on the root of the project.

`$ echo "pokemon-api" > .ruby-gemset`

`$ cd ..`

`$ cd pokemon-api`

### Installing dependencies

`$ gem install bundler`

`$ bundle install`

### Creating the database

- Run

  `$ cp config/database.yml.template config/database.yml`

- Edit the database.yml to specify your specific database username/password if needed.
- Run

  `$ rails db:create`

  `$ rails db:migrate`

  `$ rails db:seed` (If you want dummy seeds in your local database)

### Generating documentation

`$ yardoc app/controllers/concerns app/controllers application_controller.rb app/controllers/api/v1/errors_controller.rb`

### Testing

Ensure everything is fine and there're no errors

`$ rspec` (Unit tests check)

`$ rubocop` (Linter check)
