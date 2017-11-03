FROM ruby:2.4.1
EXPOSE 5000
COPY Gemfile* ./
RUN bundle install
WORKDIR /app