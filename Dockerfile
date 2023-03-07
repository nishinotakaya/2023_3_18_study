# FROM：使用するイメージ、バージョン
FROM ruby:2.6.6

RUN apt-get update -qq && apt-get install -y nodejs sqlite3

RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN gem install bundler:2.2.24
RUN bundle install
COPY . /myapp

# CMD:コンテナ実行時、デフォルトで実行したいコマンド
# Rails サーバ起動
CMD ["rails", "server", "-b", "0.0.0.0"]