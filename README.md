# テーブル設計

## users テーブル

| Column                 | Type    | Options     |
| ---------------------  | ------- | ----------- |
| nickname               | string  | null: false |
| email                  | string  | null: false |
| password               | string  | null: false |
| password_confirmation  | string  | null: false |
| family_name            | string  | null: false |
| first_name             | string  | null: false |
| family_name_katakana   | string  | null: false |
| first_name_katakana    | string  | null: false |
| birthday               | date    | null: false |

### Association

- has_many :users_items
- has_many :items, through: :users_items

## items テーブル

| Column               | Type     | Options     |
| -------------------- | -------- | ----------- |
| item_name            | string   | null: false |
| item_explanation     | string   | null: false |
| item_category        | genre_id | null: false |
| item_condition       | genre_id | null: false |
| shipping_charges     | genre_id | null: false |
| shipping_area        | genre_id | null: false |
| shipping_days        | genre_id | null: false |
| item_price           | integer  | null: false |

### Association

- has_many :users_items
- has_many :users, through: :users_items


## users_items テーブル

| Column               | Type      | Options                        |
| -------------------- | --------- | ------------------------------ |
| user                 | reference | null: false, foreign_key: true |
| item                 | reference | null: false, foreign_key: true |

- belongs_to :uer
- belongs_to :item
- has one :address

## addresses テーブル

| Column               | Type      | Options                        |
| -------------------- | --------- | ------------------------------ |
| postal_code          | integer   | null: false                    |
| prefectures          | genre_id  | null: false                    |
| city                 | string    | null: false                    |
| address              | string    | null: false                    |
| building             | string    |                                |
| phone_number         | integer   | null: false                    |
| purchase             | reference | null: false, foreign_key: true |

### Association

- belongs_to :users_items