# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version - 2.7.2
* System dependencies - Rails 5.2
* git clone  https://github.com/akshch/exp_ecomm_news.git
* Configuration
* bundle install
* Database creation
* rails db:create
* rails db:migrate
* rails server
* API endpoint to import products csv file to our database -

  POST http://localhost:3000/api/v1/products/import

  A parameter 'file' will be required to upload csv file.
* API endpoint to get all available products -

  GET http://localhost:3000/api/v1/products
* API endpoint to create all News Feed into our database -

  POST http://localhost:3000/api/v1/news/create_news_feeds

  API endpoint to get all News from Database -

  GET http://localhost:3000/api/v1/news
