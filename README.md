# Jungle

A mini e-commerce application built with Rails 4.2. Using Stripe to order items and "make payments". Model and Feature testing is done with Rspec. Also using basic http authentication in ruby to secure the "admin" side the site. With successful login admins can create new catagories and products and save them to the database.

## The Product

Navigating the page, and adding items to the cart.

![Navigating the site](https://github.com/rahulshial/Jungle/blob/master/docs/user_navigation.gif)

Accessing the Admin side of the site.

![Accessing the admin side](https://github.com/rahulshial/Jungle/blob/master/docs/admin_navigation.gif)



## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

New feature
- Ability for admns to create Sale records
  - name
  - percent off
  - starts_on (date)
  - ends_on (date)

- Once any sale is active, display it on any page  and affect the prices
- 