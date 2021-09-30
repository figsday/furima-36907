# users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| birthday           | date   | null: false               |

# Association
- has_many :items
- has_many :users

# items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user_id            | references | null: false, foreign_key: true |
| item_name          | string     | null: false                    |
| image              | string     | null: false                    |
| description        | text       | null: false                    |
| price              | integer    | null: false                    |
| category_id        | references | null: false, foreign_key: true |
| condition_id       | references | null: false, foreign_key: true |
| shipping_fee_id    | references | null: false, foreign_key: true |
| ship_from_id       | references | null: false, foreign_key: true |
| delivery_time      | references | null: false, foreign_key: true |

# Association

- belongs_to :user
- has_one    :history

# histories テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user_id            | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |

# Association

- belongs_to :item
- belongs_to :user
- has_one    :address

# addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| region_id     | references | null: false, foreign_key: true |
| city          | string     | null: false                    |
| block_num     | string     | null: false                    |
| building_name | string     |                                |
| phone_num     | string     | null: false,                   |

# Association

- belongs_to :history
