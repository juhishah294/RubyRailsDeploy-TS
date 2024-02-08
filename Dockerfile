# Use an official Ruby runtime as a parent image
FROM ruby:3.2.3

# Set the working directory in the container
WORKDIR /usr/src/app

# Install dependencies
RUN apt-get update && \
    apt-get install -y nodejs npm && \
    npm install -g yarn

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install Ruby gems
RUN bundle install

# Copy the main application
COPY . .

# Expose port 3000 to the outside world
EXPOSE 3000

# Start the Rails application
CMD ["rails", "server", "-b", "0.0.0.0"]
