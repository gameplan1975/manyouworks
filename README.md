# README

- windows10でvagrant環境で開発しているため
  - postgresqlのバージョンが9.5.21で止まっています。
  - RSpecでテストの際、ブラウザが起動しない（failure時のスクリーンショットは撮影できる）
  - Rspecでテストの際、日本語が文字化けする(表記を英語に統一。最後にja.ymlで変更)
等があります。

- 以下は現在のテーブルとカラムの内容です。
  - step3にてtask tableに優先順（priority)を追加
  - ラベルの仕様確定につきtable追加


user table
|column_name|type|
|:---:|:---:|
|id||
|name|string|
|admin|boolean|
|email|string|
|password_digest|string|

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

label table
|column_name|type|
|:---:|:---:|
|id||
|title|string|

labeling table
|column_name|type|
|:---:|:---:|
|id||
|label_id|foregin_key|
|task_id|foregin_key|