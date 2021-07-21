# RAILS MAGIG PROJECT
This project is meant to help me unravel the Rails magic on how the app starts and how the server runs.

## Part 1

Create a small Ruby on Rails application with no front-end specialness. Literally it can look like crap, just want it to work.

DO NOT USE SCAFFOLDING OR GENERATE. NOT EVEN RAILS NEW
BUILD EVERY SINGLE FILE BY HAND. I MEAN IT
The purpose of this is to understand what each file does and what loads it.

Because this is so broad I would recommend running rails new to get started in a different directory, and then recreate only what you need in the actual repo. Figuring out what you actually need is basically the challenge here. 

With every file we need to answer just a couple questions:

* Why do I need this?
* When is it loaded?
* Why is the file in this location?

## Part 2

* Users can login and can have type “user” or “admin”;
* Users can view the inventory of cars and their details;
* “Admin” users can add and delete cars from the inventory;
* Cars;
    - Have a monetary price. The price depreciates 2% every month
    - Can be new or used
* Cars are located at a dealership, there may be multiple dealerships;
* Please include at least two tests;
    - You may choose which kind of tests to write (unit, integration...)


--------------------------------------------------------------------------------
## Cath's project journal

  1. create  config.ru 
    - This is where the rails application actually starts itself and the server
        - run Rails.application
        - Rails.application.load_server
    - It’s loaded when we run rails s
    - require_relative: config/environment.rb


  2. create  config/environment.rb
    - initializes the application
        - Rails.application.initialize!
    - require_relative: config/application.rb


  3. create  config/application.rb

  - Bundler.require(*Rails.groups) - ???
  - Has a module Sample(name of the application) that 
      - inherits from Rails::Application
      - is responsible for executing all railties and engines initializers
      - It also executes some bootstrap initializers and finishing initializers, after all the others are executed
  - Initializes the Rails version in it
  - I think this holds any core settings that we might need to change for Rails itself(application, engines, and railties)
      - These settings can be overridden in specific environments using the files in config/environments, which are processed after


  4. create  config/boot.rb

  - Documentation: is responsible for loading Bundler and setting it up.
      - If the Gemfile exists, then bundler/setup is required. The require is used by Bundler to configure the load path for your Gemfile's dependencies.
      - Bundler is an exit from dependency hell, and ensures that the gems you need are present in development, staging, and production.


  5. create  Gemfile

  - which declares all dependencies of the application. 
  - Why do I need this? - This holds all the gems used in the application.
  - When is it loaded? - everytime the server starts

  6. create Gemfile.lock

  - After running bundle install this file was created
  - This is where Bundler records the exact versions that were installed.


  7. create  bin
  8. create  bin/rails

  - Has a APP_PATH constant that will be used later in rails/commands


  9. create  app

  - organizes all application components


  10. create  config/puma.rb

  - Puma is a small library that provides a very fast and concurrent HTTP 1.1 server for Ruby web applications.


  11. create  bin/spring

  - Documentation: Spring is a Rails application preloader. It speeds up development by keeping your application running in the background so you don't need to boot it every time you run a test, rake task or migration.


  12. create  app/assets/config/manifest.js

  - This for compiling assets stuff
  - Sprockets 3 introduced the concept of a "manifest" file that could list all assets you want to make available using the link directive.
      - Sprockets is a Ruby library for compiling and serving web assets. Sprockets allows to organize an application's JavaScript files into smaller more manageable chunks that can be distributed over a number of directories and files. It provides structure and practices on how to include assets in our projects

  13. create  tmp
  14. create  tmp/cache

  - is a temporary backup, cache, or other data file created automatically by a software program.


  15. create  log

  - All the informations about your web applications requests are written in it, and it is quite useful. When you start your application with rails s you can see it (it is tailing the development.log)


`rails s`
```
 Webpacker configuration file not found /Users/catharinakomrij/Code/courses/rails-magic/used-cars/config/webpacker.yml. Please run rails webpacker:install Error: No such file or directory @ realpath_rec - /Users/catharinakomrij/Code/courses/rails-magic/used-cars/config/webpacker.yml (RuntimeError)
```


  16. create  config/webpacker.yml

  - Documentation: The goal of webpack, or any front-end build system, is to allow you to write your front-end code in a way that is convenient for developers and then package that code in a way that is convenient for browsers. With webpack, you can manage JavaScript, CSS, and static assets like images or fonts. Webpack will allow you to write your code, reference other code in your application, transform your code, and combine your code into easily downloadable packs.


🎉 THE SERVER STARTED FOR THE FIRST TIME 🎉


  17. create  .gitignore

  - Documentation:  Specifies intentionally untracked files to ignore 
  - This is so when code is pushed into github the things inside won’t go, sensitive stuff like log/ and tmp/ 💀

