#!/bin/bash

# ------------------- 概要 -------------------
# 動作テスト用に一時的にDBサーバーをDocker上に作成する
# データベース名はTEST

# ------------------- 使い方 -------------------
# 本シェルを実行後、以下コマンドで接続できる
# $ mysql -h 127.0.0.1 --port 43306 -uroot -ppassword
# DBeaverやSequelProなどDB接続ツールも使用可能
# MySQL8は認証プラグインが新しくなったためSequelProは色々設定しないと繋がらない
# https://qiita.com/yusuke_dev/items/7f0ca12ced72363f9448
# 終了時のコマンドは以下の通り
# docker container stop mysql

# ------------------- コマンド詳細 -------------------
# https://docs.docker.com/engine/reference/commandline/container_run/
# docker container run:  Run a command in a new container
# --rm:  Automatically remove the container when it exits
# -d:  Run container in background and print container ID
# -v:  Bind mount a volume　（相対パス ./tmp_db_init_football だとなぜか動かない）
# -e:  Set environment variables
# -p:  Publish a container’s port(s) to the host
# --name:  Assign a name to the container

docker container run --rm -d \
 -v /Users/kazuma/db_sample/tmp_db_init_football:/docker-entrypoint-initdb.d \
  -e MYSQL_ROOT_PASSWORD=password \
  -p 43306:3306 --name mysql mysql:8
