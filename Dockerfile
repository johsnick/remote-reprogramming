FROM ruby:2.4.1
ADD Gemfile* /
RUN bundle install
WORKDIR /app
CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "5000"]
