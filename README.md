# DB 設計

## user table

| Column             | Type                | Options                  |
|--------------------|---------------------|------------------------- |
| email              | string              | null: false ,unique: true|
| encrypted_password | string              | null: false              |
| nickname           | string              | null: false              |
| family_name        | string              | null: false              |
| first_name         | string              | null: false              |
| family_name_kana   | string              | null: false              |
| first_name_kana    | string              | null: false              |
| birth_day          | date                | null: false              | 

### Association

- has_many :products, dependent: :destroy
- has_many :history, dependent: :destroy

##  destination table

| Column                              | Type       | Options                              |
|-------------------------------------|------------|--------------------------------------|
| post_code                           | string     | null: false                          |
| prefecture_id                       | integer    | null: false                          |
| city                                | string     | null: false                          |
| address                             | string     | null: false                          |
| building_name                       | string     |                                      |
| phone_number                        | string     |null: false                           |
| history                             | reference  |null: false,foreign_key:true          |


### Association

- belongs_to :history

## product table

| Column             | Type                | Options                                    |
|--------------------|---------------------|--------------------------------------------|
| name               | string              | null: false                                |  
| price              | integer             | null: false                                |
| status_id          | integer             | null: false                                |
| category_id        | integer             | null: false                                |
| description        | text                | null: false                                |
| judgment_id        | integer             | null: false                                |
| day_id             | integer             | null: false                                | 
| prefecture_id      | integer             | null: false                                |
| user               | reference           | null: false, foreign_key:true              |

### Association
- belongs_to :user 
- has_one : history


## history table

| Column      | Type       | Options                                    |
|-------------|------------|--------------------------------------------|
| user        | references | null: false, foreign_key: true             |
| product     | references | null: false, foreign_key: true             |


### Association
- belongs_to :user
- belongs_to :product
- has_one :destination

