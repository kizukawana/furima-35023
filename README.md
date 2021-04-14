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
| birthday            | date   | null: false |



### Association

- has_many :items
- has_many :lists      


## items テーブル

| Column              | Type        | Options                        |
| ------------------- | ------      | ------------------------------ |
| name                | string      | null: false                    |
| explanation         | text        | null: false                    |
| category_id         | integer     | null: false                    | 
| condition_id        | integer     | null: false                    |
| delivery_fee_id     | integer     | null: false                    |
| area_id             | integer     | null: false                    |
| days_id             | integer     | null: false                    |
| price_id            | integer     | null: false                    | 
| user                | references  | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :lists
## information テーブル

| Column              | Type       | Options                        |
| ------------------- | ------     | -----------                    |
| postal_code         | string     | null: false                    |
| prefecture_id       | integer    | null: false                    |
| municipality        | string     | null: false                    |
| address             | string     | null: false                    |
| building_name       | string     |                                |
| phone_number        | string     | null: false                    |
| list                | references | null: false, foreign_key: true |


- belongs_to :list

## lists テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :information
