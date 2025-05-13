# テーブル設計

## users テーブル

| Column             | Type    | Options         |
|--------------------|---------|-----------------|
| id                 | integer | PK              |
| nickname           | string  | NOT NULL        |
| email              | string  | NOT NULL,UNIQUE |
| encrypted_password | string  | NOT NULL        |
| last_name          | string  | NOT NULL        |
| first_name         | string  | NOT NULL        |
| last_name_kana     | string  | NOT NULL        |
| first_name_kana    | string  | NOT NULL        |
| birth_date         | date    | NOT NULL        |

### Association

- has_many :items
- has_many :orders


## items テーブル

| Column           | Type    | Options      |
|------------------|---------|--------------|
| id               | integer | PK           |
| user_id          | integer | NOT NULL, FK |
| name             | string  | NOT NULL     |
| description      | text    | NOT NULL     |
| category_id      | integer | NOT NULL     |
| condition_id     | integer | NOT NULL     |
| shipping_fee_id  | integer | NOT NULL     |
| prefecture_id    | integer | NOT NULL     |
| delivery_time_id | integer | NOT NULL     |
| price            | integer | NOT NULL     |

### Association

- belongs_to :user
- has_one :order


## orders テーブル

| Column  | Type    | Options              |
|---------|---------|----------------------|
| id      | integer | PK                   |
| user_id | integer | NOT NULL, FK         |
| item_id | integer | NOT NULL, FK, UNIQUE |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## address テーブル

| Column        | Type    | Options      |
|---------------|---------|--------------|
| id            | integer | PK           |
| order_id      | integer | NOT NULL, FK |
| postal_code   | string  | NOT NULL     |
| prefecture_id | integer | NOT NULL     |
| city          | string  | NOT NULL     |
| block         | string  | NOT NULL     |
| building      | string  |              |
| phone_number  | string  | NOT NULL     |

### Association

- belongs_to :order