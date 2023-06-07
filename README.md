# Jungle

A mini e-commerce application built with Ruby and the Rails framework

## Features of App
- The visitor can sign up for a user account with e-mail, password (bcrypt gem), first name and last name;
- The visitor can sign in using e-mail and password (uniqueness validation);
- The visitor can navigate to different categories and items details;
- Admin users can create and delete categories;
- Admins can add new products using the new category;
- When a product has 0 quantity, a sold out badge was displayed on the product list page;
- User can fill in the cart by clicking add the products;
- When the cart is empty it displays a friendly message about how it is empty and link to the home page;
- The order page contains all information regarding chosen items and the final amount;

### Short demo video
![Demovideo](/docs/demo8.gif)

### The main page with all the products
![Main page](/docs/main.png)

### Page with products
![Like page](/docs/plants.png)

### Sign up form
![Modal page](/docs/signup.png)

### Cart without products
![Modal page](/docs/my-cart-zero.png)

### Cart with products
![Modal page](/docs/my-cart.png)


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.
More information in their docs: <https://stripe.com/docs/testing#cards>

## Tech Stack

- Rails 6.1
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
- Sypress
