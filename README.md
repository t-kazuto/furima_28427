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

- has_many :user_items
- has_many :items, through: :user_items

## items テーブル

| Column                  | Type     | Options     |
| ----------------------- | -------- | ----------- |
| name                    | string   | null: false |
| explanation             | string   | null: false |
| category_id             | integer  | null: false |
| condition_id            | integer  | null: false |
| shipping_charge_id      | integer  | null: false |
| shipping_area_id        | integer  | null: false |
| shipping_day_id         | integer  | null: false |
| price                   | integer  | null: false |

### Association

- has_many :user_items
- has_many :users, through: :user_items


## user_items テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------  | ------------------------------ |
| user                 | references | foreign_key: true              |
| item                 | references | foreign_key: true              |

- belongs_to :uer
- belongs_to :item
- has one :address

## addresses テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------  | ------------------------------ |
| postal_code          | integer    | null: false                    |
| prefecture           | integer    | null: false                    |
| city                 | string     | null: false                    |
| address              | string     | null: false                    |
| building             | string     |                                |
| phone_number         | string     | null: false                    |
| user_item            | references | foreign_key: true              |

### Association

- belongs_to :user_items