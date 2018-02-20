
FROM ruby:2.4-alpine

COPY repositories /etc/apk/repositories

RUN apk add --update gcc g++ musl-dev make git

ENV V8_VERSION 3.16.14.18

COPY libv8-${V8_VERSION}-x86_64-linux.gem /tmp/
RUN gem install /tmp/libv8-${V8_VERSION}-x86_64-linux.gem

# Validate this works
RUN gem install therubyracer && \
    cd $(dirname $(gem which therubyracer))/../ && \
    bundle install               && \
    bundle exec rake spec

