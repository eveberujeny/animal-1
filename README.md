# README

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

## addresses テーブル

| Colum         | Type       | Option                         |
| ------------- | ---------- | ------------------------------ |
| comment       | string     | null: false                    |
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