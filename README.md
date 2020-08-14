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
| birthday               | decimal | null: false |

### Association

- has_many :items, thorough: item_users
- has_one :purchase

## items テーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| item_name            | string | null: false |
| item_explanation     | string | null: false |
| exhibitor_name       | string | null: false |
| item_ price          | string | null: false |

### Association

- has_many :users, thorough: item_users
- has one :purchase

## item_users テーブル

| Column               | Type      | Options                        |
| -------------------- | --------- | ------------------------------ |
| user                 | reference | null: false, foreign_key: true |
| item                 | reference | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## purchases テーブル

| Column               | Type      | Options                        |
| -------------------- | --------- | ------------------------------ |
| user                 | reference | null: false, foreign_key: true |
| item                 | reference | null: false, foreign_key: true |

- belongs_to :uer
- belongs_to :item
- has one :address

## address テーブル

| Column               | Type      | Options                        |
| -------------------- | --------- | ------------------------------ |
| postal code          | string    | null: false                    |
| city                 | string    | null: false                    |
| address              | string    | null: false                    |
| building             | string    |                                |
| phone number         | string    | null: false                    |

### Association

-belongs_to :purchase