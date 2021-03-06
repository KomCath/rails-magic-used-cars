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

  13. create  tmp 🚨 created automatically 
  14. create  tmp/cache 🚨 created automatically

  - is a temporary backup, cache, or other data file created automatically by a software program.


  15. create  log 🚨 created automatically

  - All the informations about your web applications requests are written in it, and it is quite useful. When you start your application with rails s you can see it (it is tailing the development.log)


  `rails s`

        Webpacker configuration file not found /Users/catharinakomrij/Code/courses/rails-magic/used-cars/config/webpacker.yml. 
        Please run rails webpacker:install Error: No such file or directory @ realpath_rec - /Users/catharinakomrij/Code/courses/rails-magic/used-cars/config/webpacker.yml (RuntimeError)
   
   
  16. create  config/webpacker.yml

  - Documentation: The goal of webpack, or any front-end build system, is to allow you to write your front-end code in a way that is convenient for developers and then package that code in a way that is convenient for browsers. With webpack, you can manage JavaScript, CSS, and static assets like images or fonts. Webpack will allow you to write your code, reference other code in your application, transform your code, and combine your code into easily downloadable packs.


🎉 THE SERVER STARTED FOR THE FIRST TIME 🎉


  17. create  .gitignore

  - Documentation:  Specifies intentionally untracked files to ignore 
  - This is so when code is pushed into github the things inside won’t go, sensitive stuff like log/ and tmp/ 💀


 18. create  app/models/application_record.rb

  - Mother of all models, all other models inherit from this


 19. create  app/views/layouts/application.html.erb

  - Mother of the HTML “face” of the app
 

 20. create  app/controllers/application_controller.rb

  - Mother of all controllers, any logic that is shared between controllers should go here.


 21. create  db

  - This is where the database lives.


 22. create  config/database.yml
 
  -  Documentation: where you set up all the information to connect to the database. It differs depending on the kind of DB you use.
  - Rails uses an SQLite3 database for data storage by default, but I'm changing to PostgreSQL!


 23. To test if controller and view were working working:

     - Added to `routes.rb` 

        `root 'application#hello'` 

     - Added to `application_controller.rb` 

        ```
          def hello
            render html: "hello, used cars app 🛻-🚕-🚙-🚗"
          end
        ```

    - Got in response:
     
        `ActiveRecord::NoDatabaseError (FATAL:  database "used_car_development" does not exist` 

     - Ran `rails db:create` and got:
        
        ```
          rails aborted!
            No Rakefile found (looking for: rakefile, Rakefile, rakefile.rb, Rakefile.rb)
        ```
            

 24. create  Rakefile

  - Documentation: Rake is a popular task runner for Ruby and Rails applications. For example, Rails provides the predefined Rake tasks for creating databases, running migrations, and performing tests.


🎉 FIRST VIEW "hello, used cars app 🛻-🚕-🚙-🚗" WORKED 🎉


For timestamps I'm using `Time.now.strftime("%Y%m%d%H%M%S")`


25. Installed bcrypt gem

  -Documentation: bcrypt-ruby is a Ruby binding for the OpenBSD bcrypt() password hashing algorithm, allowing you to easily store a secure hash of your users passwords.


26. create Users table
  
  - t.string "first_name"
  - t.string "email"
  - t.string "password_digest" ⭐
  - t.boolean "admin", null: false
  - t.string "last_name"
  - t.index ["email"], name: "index_users_on_email", unique: true


  ⭐ if the column is named password the bcrypt gem won't do the encrypting, so the column must be **password_digest**
  

27. create Users Controller  

  - with basic CRUD actions


28. create Static Pages Controller and View

  - with home


29. deleted from `application.html.erb`:

    ```
      <%= stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>
      <%= javascript_pack_tag 'application', 'data-turbolinks-track': 'reload' %>
    ```

    - after getting the error:

          Sprockets::Rails::Helper::AssetNotFound in StaticPages#home
    

30. create Vehicles table

  - t.string "brand", null: false
  - t.string "model", null: false
  - t.string "trim"
  - t.integer "year", null: false
  - t.integer "vin", null: false
  - t.string "external_color", null: false
  - t.decimal "price", precision: 10, scale: 2, null: false
  - t.text "info"
  - t.bigint "user_id"
  - t.datetime "created_at", precision: 6, null: false
  - t.datetime "updated_at", precision: 6, null: false
  - t.index ["user_id"], name: "index_vehicles_on_user_id"


31. added table relationships

  - Vehicle belongs_to :user
  - User has_many :vehicles

💡💡💡

so has_secure_password is a rails method that gives me:

- a pair of virtual attributes password and password_confirmation;
- the ability to save a securely hashed password_digest attribute to the database;
- and the authenticate method

So in the end bcrypt is only hashing the password to be saved as password_digest attribute in the db

Sessions are server-side files that store the user information, whereas Cookies are client-side files that contain user information on a local computer.

💡💡💡


32. create helpers/sessions_helper.rb
  
  - because the locgic I had in applcaltion_controller to handle login and current_user wasn't working

33. added flash logic to aaplication.html.erb
    
    ```
    <% flash.each do |message| %>
      <div> <%= message %> </div>
    <% end %>
    ```

  - without it flash notice wasn't working!


34. create Vehicles Controller and routes

  - with basic CRUD actions
