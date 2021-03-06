## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|phone_number|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|birthday|date|null: false|
|icon_picture|string||
|profile|text||
|point|integer||


### Association
- has_many :products
- has_many :comments
- has_many :sms_credentials
- has_many :evaluations
- has_one  :credit
- has_one  :address


## sms_credentialsテーブル

|Column|Type|Options|
|------|----|-------|
|sns_uid|integer||
|provider|integer||
|user_id|references|null: false, foreign_key: true|


### Association
- belongs_to :user


## Creditsテーブル

|Colum|Type|Option|
|-----|----|------|
|card_number|integer|null: false, unique: true|
|expiration_month|integer|null: false|
|expiration_year|integer|null: false|
|security_code|integer|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user


## Addressesテーブル

|Colum|Type|Option|
|-----|----|------|
|first_name|string|null: false|
|last_name|string|null: false|
|postal_code|integer|null: false|
|prefecture|integer|null: false, gemの使用|
|municipality|string|null: false|
|address_number|integer|null: false|
|building_name|string|
|first_name_phonetic|string|null: false|
|last_name_phonetic|string|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user


## Evaluationsテーブル

|Colum|Type|Option|
|-----|----|------|
|user_id|references|null: false, foreign_key: true|
|value|string|null: false|


### Association
- belongs_to :user


## Commentsテーブル

|Colum|Type|Option|
|-----|----|------|
|text|text|null: false|
|user_id|references|null: false, foreign_key: true|
|product_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product


## productsテーブル

|Column|Type|Options|
|------|----|-------|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key:true|
|name|string|null: false,index:true|
|info|text|null: false|
|price|integer|null: false|
|category_id|references|null: false, foreign_key: true|
|status|enum|null: false|
|brand_id|references|null: false, foreign_key: true|
|size_id|references|null: false, foreign_key: true|
|delivery_fee_owner_id|references|null: false, foreign_key: true|
|sell_status_id|references|null: false, foreign_key: true|
|shipping_method_id|references|null: false, foreign_key: true|


### Association
- has_many : images
- has_many : comments
- belongs_to : seller_id, class_name: User
- belongs_to : buyer_id, class_name: User
- belongs_to : category
- belongs_to : brand,optional: true
- belongs_to : sell_status
- belongs_to : size
- belongs_to : status
- belongs_to : delivery_fee_owner
- belongs_to : shipping_method
- belongs_to : delivery_date


## Imageテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|references|foreign_key|
|image|string|

### Association
belongs_to :product

## Categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false,index: true|
|ancestry|string|null: false,index: true|
|belongs|string|null: false,index: true|

### Association
has_many :products

## Brandテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
has_many :products

## Sell_statusテーブル
|Column|Type|Options|
|------|----|-------|
|status|string|null: false|

### Association
has_many :products

## Sizeテーブル
|Column|Type|Options|
|------|----|-------|
|size|string|null: false|

### Association
has_many :products


## Delivery_fee_ownerテーブル
|Column|Type|Options|
|------|----|-------|
|Delivery_fee_owner|string|null: false|

### Association
has_many :products

## shipping_methodテーブル
|Column|Type|Options|
|------|----|-------|
|shipping_method|string|null: false|

### Association
has_many :products

## delivery_dateテーブル
|Column|Type|Options|
|------|----|-------|
|delivery_date|string|null: false|

### Association
has_many :products
