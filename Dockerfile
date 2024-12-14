FROM ruby:3.1.3

# NodeとYarnをインストール（Webpacker利用時必要）
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get update && apt-get install -y nodejs
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

ARG RUBYGEMS_VERSION=3.3.20
RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock /app/
RUN gem update --system ${RUBYGEMS_VERSION} && bundle install

COPY . /app

# グローバルにwebpackをインストール
RUN yarn global add webpack webpack-cli
# package.jsonがない場合は初期化
RUN yarn init -y
# 必要なパッケージをインストール
RUN yarn add @rails/webpacker webpack webpack-cli

# Webpackerのセットアップ
RUN rails webpacker:install
RUN yarn install --check-files
RUN rails webpacker:compile

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3001
CMD ["rails", "server", "-b", "0.0.0.0"]
