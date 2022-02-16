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
 * has_one :shipping_address



## products table
| Column               | Type                | Options                        |
|----------------------|---------------------|--------------------------------|
| product_name         | string              | null: false                    |
| product_explanation  | text                | null: false                    |
| product_situation    | boolean             | null: false                    |
| product_category     | boolean             | null: false                    |
| price                | boolean             | null: false                    |
| user                 | references          | null: false, foreign_key: true |
| shipping_address     | references          | null: false, foreign_key: true |


### Association
 * has_one :purchase
 - belongs_to :user
 - belongs_to :shipping_address


 ## purchases table
| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| user               | references          | null: false, foreign_key: true |
| product            | references          | null: false, foreign_key: true |
| shipping_addres    | references          | null: false, foreign_key: true |


### Association
 * has_one :product
 - belongs_to :user
 - belongs_to :shipping_address


## shipping_address table
| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| shipping_charges   | boolean             | null: false                    |
| shipment_source    | boolean             | null: false                    |
| shipping_schedule  | boolean             | null: false                    |
| user               | references          | null: false, foreign_key: true |
| product            | references          | null: false, foreign_key: true |
| purchase           | references          | null: false, foreign_key: true |


### Association
 * has_one :user
 * has_many :products
 * has_many :purchases