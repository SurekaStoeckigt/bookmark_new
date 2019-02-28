# User stories
# Bookmark Manager

As an internet user,
So that I can easily return to the pages that are important to me,
I want to be able to see the list of the pages that I've bookmarked.

As a user,
So that I can find new websites I've discovered,
I want to be able to mark the page that I'm reading.

## Domain Model
![Bookmark Manager Domain Model](snapp.jpg)
# Bookmark_manager


## How to set up the database (documents for future reference )
$ psql postgres
$ CREATE DATABASE bookmark_manager;
$ \c bookmark_manager;
$ CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));
run the query saved in 01_create_bookmarks_table.sql
$ ALTER TABLE bookmarks ADD COLUMN title VARCHAR(60);

## How to set up the test database
$ psql postgres
$ CREATE DATABASE "bookmark_manager_test";
$ \c bookmark_manager;
$ CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));

## How to set up a web app project in Ruby using Sinatra and Capybara
$ bundle init
$ list Sinatra, rspec and Capybara in gemfile
$ bundle install
$ run rspec --init to make sure the spec folder and rspec files are available.
$ set up Sinatra and Rack in controller ('require Sinatra/base', 'Class < Sinatra::Base')
$ add 'config.ru = require_relative "./app.rb", run App'
$ make Capybara talk to Sinatra in spec_helper.rb
$ create features directory
