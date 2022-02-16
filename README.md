# DB設計


## users table
| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| last_name          | string              | null: false               |
| first_name         | string              | null: false               |
| last_name_kana     | string              | null: false               |
| first_name_kana    | string              | null: false               |
| date_of_birth      | date                | null: false               |

### Association
 * has_many :products
 * has_many :purchases



## products table
| Column               | Type                | Options                        |
|----------------------|---------------------|--------------------------------|
| product_name         | string              | null: false                    |
| product_explanation  | text                | null: false                    |
| price                | integer             | null: false                    |
| user                 | references          | null: false, foreign_key: true |
| shipping_address     | references          | null: false                    |


### Association
 - belongs_to :user
 - belongs_to :shipping_address


 ## purchases table
| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| user               | references          | null: false, foreign_key: true |
| product            | references          | null: false, foreign_key: true |

### Association
 - belongs_to :product
 - belongs_to :user
 * has_one :shipping_address


## shipping_addresses table
| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| user_id            | integer             | null: false, foreign_key: true |
| product_id         | integer             | null: false, foreign_key: true |
| purchase_id        | integer             | null: false, foreign_key: true |
  

### Association
 * has_many :purchases