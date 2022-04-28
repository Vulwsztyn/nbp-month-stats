FROM ruby:3.1-alpine

WORKDIR /code
COPY . .
RUN bundle install