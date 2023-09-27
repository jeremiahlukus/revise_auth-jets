# ReviseAuth

A pure Ruby on Jets authentication system like Devise.

## Screenshots
Admin View
<img width="1726" alt="Screenshot 2023-09-26 at 8 51 56 PM" src="https://github.com/jeremiahlukus/revise_auth-jets/assets/17206638/6f249070-515d-43bf-b035-e694d073250a">

Login / Sign Up
<img width="995" alt="Screenshot 2023-09-26 at 8 52 27 PM" src="https://github.com/jeremiahlukus/revise_auth-jets/assets/17206638/5d3fb2c8-9540-4bb0-9457-8ace45173293">

Edit Profile
<img width="845" alt="Screenshot 2023-09-26 at 8 53 25 PM" src="https://github.com/jeremiahlukus/revise_auth-jets/assets/17206638/220242c2-1c2b-402c-a3eb-9245b5c5abdd">

Test Auth Route
<img width="507" alt="Screenshot 2023-09-26 at 8 53 03 PM" src="https://github.com/jeremiahlukus/revise_auth-jets/assets/17206638/569f7cfe-1868-433b-84e1-6b626b9b3d64">

## Installation

Add this line to your application's Gemfile:

```ruby
bundle add "revise_auth-jets"
```

And then execute the following to generate a `User` model (optionally adding other fields such as `first_name` and `last_name`):
```bash
$ jets g revise_auth:model User
$ jets db:migrate
$ jets g revise_auth:views
```

Add
```
require "active_record"
ActiveRecord::Base.signed_id_verifier_secret = "custom_verfifier_secret"
```
in your initializers. Set this as an env var


Create your app/mailer/application_mailer.rb

```
class ApplicationMailer < ActionMailer::Base
  default from: 'YOUR_EMAIL@gmail.com'
  layout 'mailer'
end
```


Add your stmp settings in your development.rb
ex:
```
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000, protocol: "https" }
  config.action_mailer.perform_deliveries = true
  config.action_mailer.show_previews = true
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:              'smtp.gmail.com',
    port:                 587,
    domain:               'gmail.com',
    user_name:            'USERNAME@gmail.com',
    password:             'YOUR_PASS',
    authentication:       'plain'}
```
To get your stmp pass follow these steps

You need to make a password for specific app

Step one: enable 2FA

https://myaccount.google.com/signinoptions/two-step-verification/enroll-welcome
Step two: create an app-specific password

https://myaccount.google.com/apppasswords

## Usage

ReviseAuth is designed around a single `User` model.

## What you get 
Sleek login, sign in, and edit profile screen
<img width="898" alt="Screenshot 2023-09-22 at 11 58 42 AM" src="https://github.com/jeremiahlukus/revise_auth-jets/assets/17206638/e795f74a-ea6a-4212-9baa-fb50fcaa6424">

Api capabilities with sample route `api/v1/me`
<img width="862" alt="Screenshot 2023-09-22 at 11 59 53 AM" src="https://github.com/jeremiahlukus/revise_auth-jets/assets/17206638/b11aa41b-2c4e-4f96-ac20-4e71304b9fe8">


### Roles / Other User Types

ReviseAuth only works with a single model to keep things simple. We recommend adding roles to handle other types of users.

You can accomplish this in a few different ways:

* A `roles` attribute on the `User` model
* The Rolify gem

