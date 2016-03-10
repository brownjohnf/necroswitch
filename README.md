# LiveSwitch

## Usage

Once you've got a Necroswitch server stood up somewhere:

* POST /api_keys { "email":"<your email>" }
* POST/switches { "api_key":"<your api_key>", "name":"<switch name>", "timeout":"<int seconds timeout>" }
* GET /switches?api_key=<your api_key>

## Dependencies

* some sort of SQL db
* some sort of ActionMailer-compatible email delivery server
* Twilio account

## Development

### Running locally without Docker

* clone the repo
* run bundle
* set up a SQL db
* copy .env.sample to .env
* edit .env to accurately reflect your configs
* run source .env to load the configs
* run bundle exec rake db:create db:schema:load
* run bin/rails s
* visit localhost:3000

### Running locally with Docker

* clone the repo
* run docker-compose up -d db
* run docker-compose run --service-ports api
* from inside the running container
  * run rake db:create db:migrate
  * run bin/rails s

## Production

### Deploy to Heroku

* clone the repo
* run heroku create <app-name>
* run heroku addons:create sendgrid:starter
* run heroku config:set TWILIO_ACCOUNT_SID=<your account sid>
* run heroku config:set TWILIO_AUTH_TOKEN=<your auth token>
* run git push heroku master
* hit https://<app-name>.herokuapp.com

## Deploy with Docker Compose

TODO

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

