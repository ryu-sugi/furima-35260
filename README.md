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
| password            | string              | null: false             |
| birth date          | integer             | null: false             |

### Association

- has_many :items
- has_many :buys
- has_one  :shipping addresses

## items table

| Column              | Type                | Options                 |
|-------------------- |---------------------|-------------------------|
| item                | string              | null: false             |
| item_image          | Active storageで実装 | null: false             |
| category            | text                | null: false             |
| value | integer     | null: false         | null: false             |
| description         | text                | null: false             |
| condition           | string              | null: false             |
| shipping_area       | string              | null: false             |
| shipping_day        | string              | null: false             |

### Association

- belongs_to :users
- has_one    :buys

## buys table

| Column              | Type                | Options                 |          
|-------------------- |---------------------|-------------------------|
| item                | string              | null: false             |
| nickname            | string              | null: false             |
| first_name          | string              | null: false             |
| last_name           | string              | null: false             |
| first_name_furigana | string              | null: false             |
| last_name_furigana  | string              | null: false             |
| postal_code         | integer             | null: false             |
| division            | string              | null: false             |
| town                | string              | null: false             |
| address             | integer             | null: false             |
| phone               | integer             | null: false             |
| value               | integer             | null: false             |

### Association

- belongs_to :users
- belongs_to :items

## shipping addresses table


| Column              | Type                | Options                 |          
|-------------------- |---------------------|-------------------------|
| first_name          | string              | null: false             |
| last_name           | string              | null: false             |
| first_name_furigana | string              | null: false             |
| last_name_furigana  | string              | null: false             |
| postal_code         | integer             | null: false             |
| division            | string              | null: false             |
| town                | string              | null: false             |
| address             | string              | null: false             |
| phone               | string              | null: false             |
| value               | string              | null: false             |

### Association

- belongs_to :users