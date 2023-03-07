FROM ruby:2.7.2

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get update && apt-get install -y nodejs

# Install Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

# Install SQLite and bundler
RUN apt-get install -y sqlite3 libsqlite3-dev
RUN gem install bundler

# Set the working directory and copy the application files
WORKDIR /app
COPY Gemfile* ./
RUN bundle install
COPY . ./
