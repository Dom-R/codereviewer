FROM ruby:2.5.1-alpine

WORKDIR /app

COPY . /app

RUN bundle install --without development test

ENV RACK_ENV production

CMD ["ruby", "app.rb"]
