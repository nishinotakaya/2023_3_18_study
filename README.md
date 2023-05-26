# README

## 🌟 リポジトリの所有者が行うこと

1. このリポジトリをコピーして別のリポジトリを作成する方法
   1. https://github.com/shotaimai66/readme-develop/blob/main/%E3%83%AA%E3%83%9D%E3%82%B8%E3%83%88%E3%83%AA%E3%81%AE%E3%82%B3%E3%83%94%E3%83%BC%E6%96%B9%E6%B3%95.md
2. main ブランチの保護設定とレビュー必須設定方法
   1. https://github.com/shotaimai66/readme-develop/blob/main/%E3%83%96%E3%83%A9%E3%83%B3%E3%83%81%E3%81%AE%E4%BF%9D%E8%AD%B7%E8%A8%AD%E5%AE%9A%E3%81%A8%E3%83%AC%E3%83%93%E3%83%A5%E3%83%BC%E5%BF%85%E9%A0%88%E8%A8%AD%E5%AE%9A.md
3. 開発メンバーのリポジトリへの招待
   1. 開発メンバーをリポジトリにコラボレーターとして招待する。招待の仕方についてはググってください。
4. 開発メンバーに以降の readme を参考に環境構築をしてもらう
5. main ブランチから作業ブランチを切ってもらい開発を進める。

---

## 🌟 招待されたメンバーが行うこと

1. リポジトリの git clone でローカルにソースをクローンする
2. 以降の記事を参考に環境構築を行う。
3. main ブランチから作業ブランチを切って開発を進める。

---

## 環境構築

1. まずは docker の導入
   - https://github.com/shotaimai66/readme-develop/blob/main/Docker%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB.md
2. docker の導入ができたら、以下のコマンドを打ち込んでいく。(アプリのディレクトリ内に cd コマンドで移動してから)

```ruby
# イメージのビルド
docker-compose build

# bundle intall
docker-compose run --rm web bundle install

# yarn install
docker-compose run --rm web yarn install

# db:setup
docker-compose run --rm web rails db:setup

# railsサーバー起動(ローカルPC用)
bin/dev

# railsサーバー起動(cloud9の方)
bin/dev 8080
```

## Docker image 削除方法

docker rmi -f ナンバー

## Docke container 内確認

docker ps -a

## Docke container 内の削除

## docker rm -f ナンバー

## windows の場合

## loader のエラー解消

docker-compose run --rm web npm install --save-dev pug pug-plain-loader
docker-compose run --rm web npm install --save-dev sass sass-loader@10

## webpacer のインストール

docker-compose run --rm web rails webpacker:install

## 開発コマンド

```ruby
# コンテナ起動＜binding.irbを使いたい時（docker-compose upより常にこっちの方がいいかも）＞
bin/dev

# railsサーバー起動(cloud9の方)
bin/dev 8080

# コンテナ起動
docker-compose up

# コンテナ停止
docker-compose down

# webコンテナ内でコマンド実行(`docker-compose run --rm web`と同義)
bin/docker/bundle/exec

# bundle install
bin/docker/bundle/exec bundle install

# rails db:migrate
bin/docker/bundle/exec rails db:migrate

# rails db:seed
bin/docker/bundle/exec rails db:seed
```

---

## ※※※※※※※PR 上げる前に確認してください※※※※※※※

- rspec と構文チェックと ERD の生成
  - rspec が通っているか？
  - rubocop の構文チェックでエラーが出ていないか？
  - brakeman の脆弱性診断でエラーが出ていないか？
  - ERD の更新はされているか？

以上を以下のコマンドで確認できます。

```
bin/test
```

bin/test で全てのチェックに合格すると以下のように表示されます。チェックに合格しない場合は自分で解決するか、メンバーに相談しながら解決してください。チェックに全て合格して PR を初めて上げることができます。

```
  =========================

         TEST PASSED

  =========================
```

---

## My SQL の日本語化（文字化け解消）

https://qiita.com/kotobuki5991/items/9a7e0e9ed7ebf30ba01d

## MySQL の設定ファイル（my.cnf）を探す方法

https://wa3.i-3-i.info/word13606.html

## DB を My SQL を指定して rails new する

docker-compose run web rails new . --force --database=mysql --skip-bundle

## Docker で My SQL 立ち上げ

docker-compose exec db mysql -u root -p

## テストコマンド(gem 'rspec')

```ruby
# rspec(全部実行)
bin/docker/bundle/exec rspec

 docker-compose run --rm web bundle exec rspec
```

---

## 構文チェックコマンド(gem 'rubocop')

```ruby
# rubocop
bin/docker/bundle/exec rubocop

# rubocop(自動整形)
bin/docker/bundle/exec rubocop -a
```

---

## 脆弱性チェックコマンド(gem 'brakeman')

```ruby
# brakeman
bin/docker/bundle/exec brakeman --no-pager
```

---

## ER 図の生成(gem 'erd')

```ruby
# ER図の生成
bin/docker/bundle/exec erd
```

---

## docker がおかしくなった時や docker のリソースを一回リセットするとき

```ruby
# 現在のディレクトリのdocker-composeコマンドで作成したイメージやコンテナ、ボリューム、ネットワークを削除するコマンド
docker-compose down --rmi local -v
```

---

## css と js ファイルの適応について

- webpacker を使用しているので、js と css ファイルの場所が app/assets 配下ではなく、app/javascript 配下にあります。app/javascript の中にサンプルの css と js があるのでそちらを参考に実装してみてください。

## rspec について

- ./spec ディレクトリ内にサンプルのテストファイル(model_spec,request_spec,system_spec があるのでそれを参考に、テストを書いてください。一つのタスクに１個でもいいのでググりながら、テストを書くように頑張ってみましょう！)

## heroku デプロイ方法

- https://github.com/shotaimai66/readme-develop/blob/main/rails7/rails7-heroku-deploy.md

## その他開発用 readme（こちらも必ず確認ください！！）

- https://github.com/shotaimai66/readme-develop
