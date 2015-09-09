# Rails Girls Instagram Slider

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

#### Boot the app
````
$ docker-compose up
````
