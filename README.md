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
| Column                 | Type                | Options                        |
|------------------------|---------------------|--------------------------------|
| product_name           | string              | null: false                    |
| product_explanation    | text                | null: false                    |
| category_id            | integer             | null: false                    |
| product_status_id      | integer             | null: false                    |
| shipping_charge_id     | integer             | null: false                    |
| shipping_area_id       | integer             | null: false                    |
| ship_id                | integer             | null: false                    |
| price                  | integer             | null: false                    |
| user                   | references          | null: false, foreign_key: true |
| shipping_addresses     | references          | null: false                    |


### Association
 - belongs_to :user
 - belongs_to :purchase


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
| purchase           | references          | null: false, foreign_key: true |
| zip_code           | string              | null: false                    |
| prefectures        | string              | null: false                    |
| minicipalities     | string              | null: false                    |
| block_number       | string              | null: false                    |
| building           | string              | null: false                    |
| tel                | string              | null: false                    |

### Association
 - belongs_to :purchase