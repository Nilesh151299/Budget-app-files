# Use the official Ruby image
FROM ruby:3.2

# Set working directory
WORKDIR /app

# Install dependencies
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the rest of the app
COPY . .

# Precompile assets (optional, depends on your app)
# RUN bundle exec rake assets:precompile

# Expose port (commonly used by Rails)
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]

