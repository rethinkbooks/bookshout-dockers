FROM ruby:2.3.1-alpine

# basic git stuff for ruby
RUN apk --no-cache add curl openssl ca-certificates git openssh tzdata

# nokogirl / compiling native extensions
RUN apk --no-cache add build-base libxml2-dev libxslt-dev mariadb-dev linux-headers
#RUN gem install raindrops -v '0.18.0'
#RUN gem install nokogiri --no-doc --no-ri -v "~> 1.6"
#RUN apk del build-base
