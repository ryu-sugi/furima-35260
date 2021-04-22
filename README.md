# DB 設計

## users table

| Column              | Type                | Options                 |          
|-------------------- |---------------------|-------------------------|
| nickname            | string              | null: false             |
| first_name          | string              | null: false             |
| last_name           | string              | null: false             |
| first_name_furigana | string              | null: false             |
| last_name_furigana  | string              | null: false             |
| email               | string              | null: false             |
| encrypted_password  | string              | null: false             |
| birth date          | date                | null: false             |

### Association

- has_many :items
- has_many :buys
- has_one  :shipping addresses

## items table

| Column              | Type                | Options                 |
|-------------------- |---------------------|-------------------------|
| item                | string              | null: false             |
| item_image          | Active storageで実装 | null: false             |
| category_id         | integer             | null: false             |
| value | integer     | null: false         | null: false             |
| description         | text                | null: false             |
| condition_id        | integer             | null: false             |
| Shipping_cost_id    | integer             | null: false             |
| shipping_area_id    | integer             | null: false             |
| shipping_day_id     | integer             | null: false             |
| user                | references          | foreign_key: true       |


### Association

- belongs_to :users
- has_one    :buys

## buys table

| Column              | Type                | Options                 |          
|-------------------- |---------------------|-------------------------|
| user                | references          | foreign_key: true       |
| item                | references          | foreign_key: true       |
### Association

- belongs_to :users
- belongs_to :items

## shipping addresses table


| Column              | Type                | Options                 |          
|-------------------- |---------------------|-------------------------|
| postal_code         | string              | null: false             |
| division            | string              | null: false             |
| town                | string              | null: false             |
| address             | string              | null: false             |
| phone               | string              | null: false             |
| value               | string              | null: false             |
| buy                 | references          | foreign_key: true       |

### Association

- belongs_to :users