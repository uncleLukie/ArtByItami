# Use the official Ruby image as the base image
FROM ruby:latest

# Update and install dependencies
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev

# Set the working directory
WORKDIR /app

# Copy the Gemfile and Gemfile.lock to the working directory
COPY Gemfile* ./

# Install gems
RUN bundle install

# Copy the project files to the working directory
COPY . .

# Expose the port on which the app will run
EXPOSE 4000

# Run the Jekyll server
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
