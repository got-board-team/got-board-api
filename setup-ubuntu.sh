#!/usr/bin/env bash
sudo apt-get install postgresql postgresql-contrib libpq-dev

cp .env.example .env

echo "
Set postgres user password

    sudo -u postgres psql postgres

  type '\password'

After that set password config proiject variable in .env file
Then

  rake db:setup
  bundle install --path vendor

And your are ready to go.
"
