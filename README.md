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
| name                 | string   | null: false |
| explanation          | string   | null: false |
| category             | integer  | null: false |
| condition            | integer  | null: false |
| shipping_charges     | integer  | null: false |
| shipping_area        | integer  | null: false |
| shipping_days        | integer  | null: false |
| price                | integer  | null: false |

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
| prefectures          | integer   | null: false                    |
| city                 | string    | null: false                    |
| address              | string    | null: false                    |
| building             | string    |                                |
| phone_number         | string    | null: false                    |
| user_item            | reference | null: false, foreign_key: true |

### Association

- has one :users_items