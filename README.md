# DB 設計

## user table

| Column             | Type                | Options                  |
|--------------------|---------------------|------------------------- |
| email              | string              | null: false ,unique: true|
| password           | string              | null: false              |
| nickname           | string              | null: false              |
| family_name        | string              | null: false              |
| first_name         | string              | null: false              |
| birth_day          | date                | null: false              | 

### Association

- has_many :products, dependent: :destroy
- has_many :history, dependent: :destroy

##  destination table

| Column                              | Type       | Options                              |
|-------------------------------------|------------|--------------------------------------|
| family_name                         | string     | null: false                          |
| first_name                          | string     | null: false                          |
| post_code                           | string     | null: false                          |
| prefecture                          | string     | null: false                          |
| city                                | string     | null: false                          |
| address                             | string     | null: false                          |
| building_name                       | string     |                                      |
| text                                |text        |null: false                           |

### Association

- belongs_to :history

## product table

| Column             | Type                | Options                                    |
|--------------------|---------------------|--------------------------------------------|
| name_id            | integer             | null: false                                |  
| price_id           | integer             | null: false                                |
| status_id          | integer             | null: false                                |
| dey_id             | integer             | null: false                                |
| judgment_id        | integer             | null: false                                | 
| prefecture_id      | integer             | null: false                                |
| user_id            | integer             | null: false, foreign_key: true             |

### Association
- belongs_to :user 
- has_one : history


## history table

| Column      | Type       | Options                                                |
|-------------|------------|--------------------------------------------------------|
| user        | integer    | references, null: false, foreign_key: true             |
| product     | integer    | references, null: false, foreign_key: true             |


### Association
- belongs_to :user
- belongs_to :product
- has_one :destination




