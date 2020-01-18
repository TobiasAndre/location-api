# Location API

This project is a Ruby on Rails API that converts street addresses or places names to coordinates. This solution uses
[LocationIQ](https://locationiq.com/) API, [PostgreSQL](https://www.postgresql.org/) is used as a database, [Redis](https://redis.io/) is used to cache api results and [Swagger](https://swagger.io/) for API documentation.

## Getting Started

There are two ways to run this project: with [Docker](https://www.docker.com/products/docker-desktop) or local.

### Running Local

```
Ruby version: 2.6.3
Rails version: 6.0.2
```

If you run this project local, you need to change `config/database.yml` file, setting your own database configuration.

Example:
```yml
default: &default
  adapter: postgresql
  encoding: unicode
  host: localhost
  user: postgres
  password: your_db_pass
  port: 5432
```

After changes on `database.yml`, you may run the script command `sh start.sh` on the root project directory. This script file has all setup needed to install
dependencies, create database and run migrations, tests and also create a user showing a token that you need to consume the main api endpoint.

### Running with docker

This project has a Dockerfile and docker-compose file to build all environment with two simple commands:

`$ docker-compose build`

`$ docker-compose up`

After installation, your API token will apear in terminal like this:
```
==============================================================================
 YOUR BEARER TOKEN IS: eyJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImFkbWluQGFk ....
==============================================================================
```
Just copy that token to use on the API documentation: [http://localhost:3000/api-docs](http://localhost:3000/api-docs)

Click on the `Authorize` button and paste your token to proceed.

![screen](/screenshots/01.png)

After the token authorization, expand the endpoint item, and click on the `Try it out` button, to show the parameter field to type an address or location name to find.

![screen](/screenshots/02.png)

Example finding by `checkpoint charlie` location name:

![screen](/screenshots/03.png)

## Running the tests manually

If you would like to run tests manually, in a local installation, just run in your terminal (root project directory):

```
$ bundle exec rails rspec
```

A test coverage report will appear on the end.

```
Coverage report generated for RSpec to /app/coverage. 105 / 105 LOC (100.0%) covered.
```

## Final considerations
I chose to get data from API directly using a rest client instead of using the [ruby solution](https://github.com/location-iq/locationiq-ruby-client) for LocationIQ because LocatinIQ didn't test that solution.
It is not a good practice to leave the master.key file in the project directory, but I did because of I still this repository private.
