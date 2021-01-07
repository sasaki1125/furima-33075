# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| password           | string              | null: false             |
| nickname           | string              | null: false             |
| family_name        | string              | null: false             |
| first_name         | string              | null: false             |
| family_name_kana   | string              | null: false             |
| first_name_kana    | string              | null: false             |
| birth_day          | integer             | null: false             |

### Association

- has_many :products dependent: :destroy
- belongs_to :destination dependent: :destroy
- belongs_to :card dependent: :destroy

##  destination table

| Column                              | Type       | Options                              |
|-------------------------------------|------------|--------------------------------------|
| user_id                             | integer    | null: false, foreign_key: true       |
| family_name                         | string     | null: false                          |
| first_name                          | string     | null: false                          |
| family_name_kana                    | string     | null: false                          |
| first_name_kana                     | string     | null: false                          |
| post_code                           | string     | null: false                          |
| prefecture                          | string     | null: false                          |
| city                                | string     | null: false                          |
| address                             | string     | null: false                          |
| building_name                       | string     | null: false                          |
| phone_number                        | string     |                                      |


### Association

- belongs_to :user

## card table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| user_id     | text       | null: false       |
| card_id     | references | foreign_key: true |

### Association

- belongs_to :user

## product table

| Column             | Type                | Options                                    |
|--------------------|---------------------|--------------------------------------------|
| name               | string              | null: false                                |  
| price              | string              | null: false                                |
| description        | string              | null: false                                |
| status             | string              | null: false                                |
| size               | string              | null: false                                |
| judgment           | string              | null: false                                | 
| prefecture_id      | string              | null: false                                |
| user_id            | integer             | null: false, foreign_key: true             |

### Association
- belongs_to :user dependent: :destroy
- has_many :images dependent: :destroy
- belongs_to_active_hash :prefecture

## image table

| Column      | Type       | Options           |
|-------------|------------|-------------------|
| image       | string     | null: false       |
| product     | integer    | foreign_key: true |

### Association

belongs_to :product

## purchase table

| Column      | Type       | Options                                    |
|-------------|------------|--------------------------------------------|
| user_id     | integer    | null: false, foreign_key: true             |
| product_id  | integer    | null: false, foreign_key: true             |


### Association

 belongs_to :user
 belongs_to :product





