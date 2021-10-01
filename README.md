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
- has_many :histories

# items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item_name          | string     | null: false                    |
| description        | text       | null: false                    |
| price              | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| shipping_fee_id    | integer    | null: false                    |
| region_id          | integer    | null: false                    |
| delivery_time_id   | integer    | null: false                    | 

# Association

- belongs_to :user
- has_one    :history

# histories テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

# Association

- belongs_to :item
- belongs_to :user
- has_one    :address

# addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| region_id     | integer    | null: false                    |
| city          | string     | null: false                    |
| block_num     | string     | null: false                    |
| building_name | string     |                                |
| phone_num     | string     | null: false,                   |

# Association

- belongs_to :history
