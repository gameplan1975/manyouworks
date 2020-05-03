# README

＊windows10でvagrant環境で開発しているため
・postgresqlのバージョンが9.5.21で止まっています。
・RSpecでテストの際、ブラウザが起動しない
（failure時のスクリーンショットは撮影できる）
等があります。

＊以下は現在のテーブルとカラムの内容です。
ラベルの仕様がよくわからないので現在はtaskのカラム（label)として設定しています。
仕様が膨らんだときは、labelを別テーブルとして再設定。

- user table
-- id
-- name[string]
-- admin[boolean]

- task table
-- id
-- user_id(foregin_key)
-- name[string]
-- status[string]
-- label[string]
-- limit[date]
