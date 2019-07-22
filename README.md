# README

# データベース設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birthday|string|null: false|
|phone_number|string|null: false|
|introduction|text||

### Association
- has_one :residence
- has_one :card
- has_many :items

## cardテーブル
|Column|Type|Options|
|------|----|-------|
|user|reference|foreign_key:true, null: false|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user

## residenceテーブル
|Column|Type|Options|
|------|----|-------|
|user|reference|foreign_key:true, null: false, type: :bigint|
|zip_code|integer|null: false|
|prefecture|string|null: false|
|town|string|null: false|
|address|text|null: false|
|address2|text||

### Association
- belongs_to :user

# commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user|reference|foreign_key:true, null: false|
|item|reference|foreign_key:true, null: false|
|text|text|null: false|

### Association
- belongs_to :user
- belongs_to :item

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|photo|reference|foreign_key:true, null: false|
|category|reference|foreign_key:true, null: false|
|bland|reference|foreign_key:true|
|item_name|string|null: false|
|explain|text|null: false|
|seller_id|bigint|null: false|
|buyer_id|bigint||
|status|string|null: false|
|delivery_cost|string|null: false|
|delivery_prefecture|string|null: false|
|delivery_date|string|null: false|
|price|integer|null: false|

### Association
- belongs_to :user
- has_many :comments
- belongs_to :category
- belongs_to :bland

# photosテーブル
|Column|Type|Options|
|------|----|-------|
|item|reference|foreign_key:true, null: false,type: :bigint|
|image|string|null: false|

### Association
- belongs_to :item

# categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category_name|string|null: false|
|ancestry|string||

### Association
- has_many :item

# brandsテーブル
|Column|Type|Options|
|------|----|-------|
|brand_name|string|null: false|

### Association
- has_many :item

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
