# Rails Girls Instagram Slider

[![Build Status](https://snap-ci.com/jlucasps/rails-girls-instagram-slider/branch/master/build_image)](https://snap-ci.com/jlucasps/rails-girls-instagram-slider/branch/master)

### Important:
[Deployment pipeline](https://app.snap-ci.com/jlucasps/rails-girls-instagram-slider/branch/master) will be unavailable after [snap-ci shutdown](https://blog.snap-ci.com/blog/2017/02/06/2017-02-06-snap-announcement/).

#### Build docker image
````
$ docker-compose build
````

#### Run rubocop
````
$ docker-compose run web rubocop
````

#### Run tests
````
 $ docker-compose run -e RAILS_ENV=test web rake test
````

#### Run rake tasks
````
$ docker-compose run web rake db:create
````

#### Get valid crednetials on Instagram and place on docker-compose.yrml
````
$ cp docker-compose.default.yml docker-compose.yml
````

#### Boot the app
````
$ docker-compose up
````

