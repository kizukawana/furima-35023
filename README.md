# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| password            | string | null: false |
| first_name_kanji    | string | null: false |
| last_name_kanji     | string | null: false |
| first_name_kana     | string | null: false |
| last_name_kana      | string | null: false |
| birthday            | string | null: false |
| password            | string | null: false |



### Association

- has_many :items
- has_many :information 　through: :items
- has_one :lists

## items テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| image               | string | null: false |
| name                | string | null: false |
| explanation         | string | null: false |
| category            | text   | null: false |
| condition           | string | null: false |
| delivery_fee        | string | null: false |
| area                | string | null: false |
| days                |datetime| null: false |
| price               | string | null: false |


### Association

- belongs_to :users
- has_many :information through :users
- has_one :items
## information テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| postal_code         | string | null: false |
| prefecture          | string | null: false |
| municipality        | string | null: false |
| address             | string | null: false |
| building_name       | string | null: false |
| phone_number        | string | null: false |



- belongs_to :users
- has_many   :items

## lists テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :users