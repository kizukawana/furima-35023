# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | unique: true|
| encrypted_password  | string | null: false |
| first_name_kanji    | string | null: false |
| last_name_kanji     | string | null: false |
| first_name_kana     | string | null: false |
| last_name_kana      | string | null: false |
| birthday            | string | null: false |



### Association

- has_many :items
- has_many :information 　
- has_one  :list

## items テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| image               | string | null: false |
| name                | string | null: false |
| explanation         | string | null: false |
| category            | integer| null: false |
| condition           | string | null: false |
| delivery_fee        | string | null: false |
| area                | string | null: false |
| days                |datetime| null: false |
| price               | string | null: false |


### Association

- belongs_to :user
- has_many :information through: :users
- has_one :item
## information テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| postal_code         | string | null: false |
| prefecture          | string | null: false |
| municipality        | string | null: false |
| address             | string | null: false |
| building_name       | string |             |
| phone_number        | string | null: false |

- has_many   :items through: :users
- belongs_to :user

## lists テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user