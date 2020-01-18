# LOCATION API

This project is a Ruby on Rails API that searches coordinates about an address or location name.
[LocationIQ](https://locationiq.com/) is used to search a string parameter and return a list of coordinates.
The Location API returns the first result returned.

* Ruby version: 2.6.3

* Rails version: 6.0.2

* Database: PostgreSQL

* Database initialization:
  
  `$ rails db:setup`

* How to run the test suite:

  `$ rspec`

* Services and cache
  
  This API uses REDIS to cache results, for 30 days.

* Documentation
  
  Access API documentation at:

  [http://localhost:3000/api-docs](http://localhost:3000/api-docs)

* Deployment instructions

* ...
