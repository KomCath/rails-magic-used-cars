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
