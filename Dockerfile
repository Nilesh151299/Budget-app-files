FROM ruby:3.1.2


# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn

# Set working directory
WORKDIR /app

# Copy Gemfiles and install gems
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

# Copy app source
COPY . /app

# Precompile assets (if needed, optional for dev)
# RUN bundle exec rake assets:precompile

# Expose port
EXPOSE 3000

# Default command
CMD ["bash", "-c", "rm -f tmp/pids/server.pid && bundle exec rails s -b 0.0.0.0"]

