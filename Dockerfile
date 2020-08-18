FROM ruby:2.6.3-alpine

ENV FOLDER=/app \
  RACK_ENV=production \
  RAILS_ENV=production \
  PORT=3000 \
  RAILS_LOG_TO_STDOUT=true \
  BUNDLER_VERSION=2.0.2
# ENV BUILD_PACKAGES curl-dev ruby-dev build-base
# ENV DEV_PACKAGES zlib-dev libxml2-dev libxslt-dev tzdata yaml-dev sqlite-dev postgresql-dev mysql-dev
# ENV RUBY_PACKAGES ruby ruby-io-console ruby-json yaml nodejs

RUN apk add --no-cache --update \
  build-base \
  postgresql-dev \
  tzdata \
  && \
  find / -type f -iname \*.apk-new -delete && \
  rm -rf /var/cache/apk/* && \
  mkdir -p $FOLDER

WORKDIR $FOLDER

COPY Gemfile* ./

# Install required gems.
RUN gem install bundler && \
  bundle install \
  --without development test \
  --jobs `expr $(cat /proc/cpuinfo | grep -c "cpu cores") - 1` \
  --retry 3 && \
  rm -rf $GEM_HOME/*/cache/* && \
  rm -rf ~/.gem

COPY . ./

EXPOSE $PORT
CMD bundle exec rails server -e production -b 0.0.0.0 -p $PORT