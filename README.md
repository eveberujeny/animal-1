# README

# アプリ名
## オリジナルアプリケーション
<br>

# 概要  
## ユーザー登録、ペットの登録をすることで、動物に関するツイートの投稿、閲覧をすることができます。閲覧については、ユーザー登録、ペットの登録なしでもできます。投稿者と閲覧者がコミュニケーションを取ることもできます。
<br>

# 本番環境
## URL : https://animal-1-35675.herokuapp.com/
## テスト用アカウント
### 投稿者 
### メールアドレス : eve@eve 
### パスワード : a11111
### 閲覧者
### メールアドレス : beru@beru
### パスワード : a11111
<br>

# 制作背景（意図）
## 自分は前職の仕事が動物関係で、動物が好きなので、動物に関するツイートができて、動物好きの人が集まり、コミュニケーションが取れるアプリケーションを作成しました。このアプリケーションがあることで、動物に癒されストレスの軽減がされる人が増えると思います。動物好きの人が集まり、コミュニケーションも簡単に取ることができるので、動物好き同士の繋がりを持つこともできます。ペットのお友達も見つけることができるかもしれません。そんなアプリケーションになればいいと思っています。
<br>

# DEMO
## トップページ（ツイート一覧、ペット一覧）

[![Image from Gyazo](https://i.gyazo.com/f1a7981773caaffb32c611d9a1de9f8a.gif)](https://gyazo.com/f1a7981773caaffb32c611d9a1de9f8a)

## ツイート一覧とペット一覧を見ることができます。新規登録画面、ペット登録画面、ペット詳細画面、ツイート詳細画面、検索結果画面に遷移することができます。

<br>

## 新規登録画面
[![Image from Gyazo](https://i.gyazo.com/d02508eaa29296f680a579e385215396.gif)](https://gyazo.com/d02508eaa29296f680a579e385215396)
## 登録情報を入力することで、ユーザー登録をすることができます。
* 入力する内容
  * 二ックネーム
  * メールアドレス
  * パスワード
  * パスワード（確認）
  * お名前（全角）

  

<br>

## ペット登録画面
[![Image from Gyazo](https://i.gyazo.com/ba636fec2101a85dda6e92f8dabef7df.gif)](https://gyazo.com/ba636fec2101a85dda6e92f8dabef7df)
## ペットの情報を入力することで、ペットを登録することができます。
* 入力する内容
  * ペットの写真の選択
  * ペットの名前
  * ペットの紹介
  * ペットの種類の選択
  * ペットの品種
  * ペットの誕生日

<br>

## ペット詳細画面
[![Image from Gyazo](https://i.gyazo.com/35f2b34e5c7ebd40fa4c8058b456e35d.gif)](https://gyazo.com/35f2b34e5c7ebd40fa4c8058b456e35d)
## ペットの詳細を確認することが出来ます。ペット詳細画面から、この子についてのツイートを投稿することが出来ます。

<br>

## ツイート投稿画面
[![Image from Gyazo](https://i.gyazo.com/02c7092a255e58e466b0f54827cba2ac.gif)](https://gyazo.com/02c7092a255e58e466b0f54827cba2ac)
## ツイートの情報を入力することでツイートを投稿することができます。
* 入力する内容
  * 画像の選択
  * ツイートのタイトル
  * ツイートの内容

<br>

## コメント機能、いいね機能
[![Image from Gyazo](https://i.gyazo.com/3fc1800b403a2ff863444e059bb24ff1.gif)](https://gyazo.com/3fc1800b403a2ff863444e059bb24ff1)
## コメント機能については、ペットの詳細画面、ツイートの詳細画面で、コメントをすることが出来ます。
## いいね機能については、ペットの詳細画面で、いいねをつけたり外したりすることが出来ます。1人のユーザーは、一匹のペットについては一回だけいいねをつけられる仕様になっています。

<br>

## 検索機能
[![Image from Gyazo](https://i.gyazo.com/b33fa8e480472e1c66d7166c2c6d9fef.gif)](https://gyazo.com/b33fa8e480472e1c66d7166c2c6d9fef)
## トップ画面で、データーベースに入っているペットの名前、ペットの品種をプリダウン式で表示をしているので、そこから選択してもらい、検索をしてもらう仕様になっています。
<br>

# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| name               | string  | null: false               |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| password           | string  | null: false               |

### Association

- has_many :animals
- has_many :tweets
- has_many :messages
- has_many :likes

## animals テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| animal_name     | string     | null: false                    |
| animal_type_id  | text       | null: false                    |
| animal_pedigree | integer    | null: false                    |
| birthday        | date       | null: false                    |
| introduction    | integer    | null: false                    |
| image           |            | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :tweets
- has_many :likes

## tweets テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| animal        | references | null: false, foreign_key: true |
| title         | string     | null: false                    |
| text          | text       | null: false                    |
| image         |            | null: false                    |

### Association

- belongs_to :user
- belongs_to :animal
- belongs_to :messages

## comments テーブル

| Colum        | Type       |                                |
| ------------ | ---------- | ------------------------------ |
| comment_text | text       | null: false                    |
| user         | references | null: false, foreign_key: true |
| animal       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :animal

## messages テーブル

| Colum         | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| message_text  | text       | null: false                    |
| user          | references | null: false                    |
| tweet         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :tweet

## likes テーブル

| Colum  | Type    | Option |
| ------ | ------- | ------ |
| user   | integer |        |
| animal | integer |        |

### Association

- belongs_to :user
- belongs_to :animal