
FROM ruby:2.4-alpine

COPY repositories /etc/apk/repositories

ENV V8_VERSION 3.16.14.18

RUN apk add --update --no-cache --virtual build-deps build-base python git bash
RUN gem install libv8 -v ${V8_VERSION}

RUN apk add gcc g++ musl-dev make

# Validate this works
RUN gem install therubyracer && \
    cd $(dirname $(gem which therubyracer))/../ && \
    bundle install               && \
    bundle exec rake spec

RUN mkdir -p /gem/

RUN cd /usr/local/bundle/gems/libv8-${V8_VERSION}/ && \
    bundle install && \
    bundle exec rake binary && \ 
    cp $(find . -name '*.gem') /gem/

CMD ls -ltr /gem/

