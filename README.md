# RailsJwt
Super easy way to add JWT support for Rails API projects.

## Description
This gem makes it super easy to add JWT support in your Rails project. Just a few of quick steps and you are good to go!

## Usage

### Requirements
Your user model must have an `authenticate` method (that takes a password as its paramter) implemented. A common and quick way is to use [has_secure_password](https://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html#method-i-has_secure_password)

Alternatively, you can implement your own `authenticate` method, for example, if you want to authenticate with an LDAP server.

### Installation
Add this line to your application's Gemfile:

```ruby
gem 'rails_jwt'
```

And then execute:
```bash
$ bundle
```

Execute following to add configuration file in `config/initializers` folder:
```bash
$ rails g rails_jwt:install
```

Add following line in your routes.rb
```ruby
mount RailsJwt::Engine => "/auth"
```

Add the following in the controller you would to secure:
```ruby
include RailsJwt::Authentication
before_action :authenticate_user
```

Or you can create a secure controller that you can inherit in the all of the controllers you would like to secure:
```ruby
class SecureController < ApplicationController
    include RailsJwt::Authentication
    before_action :authenticate_user
end
```

### Authentication

Send a POST request:
```
POST /auth/login HTTP/1.1
Host: localhost:3000
Content-Type: application/json

{ "user_id": "test@abc.com", "password": "test"}
```

If authentication is successful, you will get a response like this:
```
{
    "jwt": "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOnsiaWQiOjF9LCJleHAiOjE2MTY4Mjg3NTZ9.gUmZaBjUM-FOM-_9T47ul4mM7c_YG8lF9l11MlGUmBM"
}
```

Pass the returned token to the header of your subsequent API call:
```
GET /users HTTP/1.1
Host: localhost:3000
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOnsiaWQiOjF9LCJ1c2VyX2lkIjoxLCJlbWFpbCI6Im1haWxAYWFtaXIucGsiLCJhY3RpdmUiOnRydWUsImV4cCI6MTYxNjc4MjU5M30.-lybW5musgaWS-g1mvTtgmeSM_oi1U7Xa_elh68Ph-c
```

## Configuration
A number of configuration options are available in `initiliazers/rails_jwt.rb` file. By default user's email will be used as a login id, however that can be modified by changing relevant entry in `rails_jwt.rb` config file (`config.user_id_attr = :login_id`).

### Custom payload
By default the payload looks like following:
```
{
 "sub": {
  "id": 1
 },
 "exp": 1616823684
}
```

In above payload `sub.id` is the unique id (primary key) of your user object that will be used to lookup the calling user. If you want to add more fields in the payload, you will need to add `jwt_payload` method in your user model:

```ruby
def jwt_payload
    {email: self.email, active: self.active}
end
```

Addition of above method will create a payload similar to the following:
```
{
 "sub": {
  "id": 1
 },
 "email": "test@abc.com",
 "active": true,
 "exp": 1616823952
}
```


## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
