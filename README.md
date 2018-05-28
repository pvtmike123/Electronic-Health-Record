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

Now, change config/database.yml file to point to your Postgres database:

   default: &default
      adapter: postgresql
      encoding: unicode

   development:
      adapter: postgresql
      encoding: unicode
      database: ehr_development
      username: your_postgres_username
      password:

   test:
      adapter: postgresql
      encoding: unicode
      database: ehr_test
      username: your_postgres_username
      password:

   production:
      adapter: postgresql
      encoding: unicode
      database: ehr_production
      username:
      password:

## Ensure Postgres is installed and run

Bundle:

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
