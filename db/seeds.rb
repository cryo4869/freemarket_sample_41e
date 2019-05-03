# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ShippingMethod.create!(shipping_method: '未定', delivery_fee_owner_id: 1)
ShippingMethod.create!(shipping_method: 'ラクラクメルカリ便', delivery_fee_owner_id: 1)
ShippingMethod.create!(shipping_method: 'ゆうメール', delivery_fee_owner_id: 1)
ShippingMethod.create!(shipping_method: 'レターパック', delivery_fee_owner_id: 1)
ShippingMethod.create!(shipping_method: '普通郵便', delivery_fee_owner_id: 1)
ShippingMethod.create!(shipping_method: 'クロネコヤマト', delivery_fee_owner_id: 1)
ShippingMethod.create!(shipping_method: 'ゆうパック', delivery_fee_owner_id: 1)
ShippingMethod.create!(shipping_method: 'クリックポスト', delivery_fee_owner_id: 1)
ShippingMethod.create!(shipping_method: 'ゆうパケット', delivery_fee_owner_id: 1)
ShippingMethod.create!(shipping_method: 'レターパック', delivery_fee_owner_id: 1)
ShippingMethod.create!(shipping_method: '未定', delivery_fee_owner_id: 2)
ShippingMethod.create!(shipping_method: 'クロネコヤマト', delivery_fee_owner_id: 2)
ShippingMethod.create!(shipping_method: 'ゆうパック', delivery_fee_owner_id: 2)
ShippingMethod.create!(shipping_method: 'ゆうメール', delivery_fee_owner_id: 2)
DeliveryDate.create!(delivery_date: '1~2日で発送')
DeliveryDate.create!(delivery_date: '2~3日で発送')
DeliveryDate.create!(delivery_date: '4~7日で発送')
DeliveryFeeOwner.create!(delivery_fee_owner: '送料込み(出品者負担)')
DeliveryFeeOwner.create!(delivery_fee_owner: '着払い(購入者負担)')
SellStatus.create!(status: '出品中')
SellStatus.create!(status: '取引中')
SellStatus.create!(status: '売却済')
