FROM ruby:2.0.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev libssl-dev
RUN mkdir /app
WORKDIR /app
ADD Gemfile /app/Gemfile
ADD . /app
RUN bundle install
