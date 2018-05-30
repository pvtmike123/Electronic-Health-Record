# README

## System dependencies

- PostgreSQL
- Ruby version 2.4.0
- Rails version 5.1.4

## Setup

Clone repository:

    https://github.com/pvtmike123/Electronic-Health-Record.git

## Install Postgres Database with Homebrew

Run:

    brew install postgres

Use the following command to start Postgres as a background service:

    brew services start postgresql

## Connect Postgres to Application

Now, change config/database.yml file to point to your Postgres database. Ensure Usernames and passwords match that of postgres on your local machine.


## Ensure Postgres is installed and run

Install Gems:

    bundle install

## Database creation

Create:

    rake db:create

Migrate:

    rake db:migrate

Seed:

    rake db:seed

## Run

    rails s

App will be running on localhost:3000
