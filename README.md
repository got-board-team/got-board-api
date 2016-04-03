# GOT Board
[![Build Status](https://semaphoreci.com/api/v1/leandrost/got-board-api/branches/master/shields_badge.svg)](https://semaphoreci.com/leandrost/got-board-api)

## Setup

1. Have installed Ruby, Bundler and Postgresql

2. Copy the .env file

``` bash
cp .env.example .env
```

Change the the variables with your values.

3. Install the gems and setup the database

``` bash
bundle install
bundle exec rake db:setup
```

## Development

To run the tests

``` bash
bundle exec rake spec
```
