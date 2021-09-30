# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| name_kana          | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :users

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item_name          | string     | null: false                    |
| image              | string     | null: false                    |
| describe           | text       | null: false                    |
| price              | string     | null: false                    |

### Association

- belongs_to :user
- has_one    :order

## orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| card_number        | string     | null: false                    |
| card_exp_month     | string     | null: false                    |
| card_exp_year      | string     | null: false                    |
| card_code          | string     | null: false                    |

### Association

- has_many   :items
- belongs_to :user
- has_one    :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| region        | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false,                   |

### Association

- belongs_to :order
 