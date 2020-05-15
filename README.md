# README

- windows10でvagrant環境で開発しているため
  - postgresqlのバージョンが9.5.21で止まっています。
  - RSpecでテストの際、ブラウザが起動しない（failure時のスクリーンショットは撮影できる）
  - Rspecでテストの際、日本語が文字化けする(表記を英語に統一。最後にja.ymlで変更)
等があります。

- 以下は現在のテーブルとカラムの内容です。
  - ラベルの仕様がよくわからないので現在はtaskのカラム（label)として設定しています。
  - 仕様が膨らんだときは、labelを別テーブルとして再設定。
  - step3にてtask tableに優先順（priority)を追加


user table
|column_name|type|
|:---:|:---:|
|id||
|name|string|
|admin|boolean|

task table
|column_name|type|
|:---:|:---:|
|id||
|user_id|foregin_key|
|name|string|
|status|string|
|priority|integer|
|label|string|
|limit|date|