FROM ruby:2.5

RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get update -qq && apt-get install -y libgmp-dev nodejs npm postgresql-client
RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN gem install bundler -v 2.0.2
RUN bundle install
COPY . /app
RUN bundle install
RUN npm install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 4000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]