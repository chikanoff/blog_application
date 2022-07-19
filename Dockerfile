FROM ruby:3.1.2-buster AS web

WORKDIR /web

COPY Gemfile /web/Gemfile
COPY Gemfile.lock /web/Gemfile.lock
RUN bundle install

COPY . /web

CMD ["./bin/entrypoint.sh"]
