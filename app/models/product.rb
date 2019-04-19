class Product < ApplicationRecord
  has_many :images
  accepts_nested_attributes_for :images
  belongs_to :delivery_fee_owner
  belongs_to :shipping_method
  belongs_to :delivery_date
  belongs_to :category
  belongs_to :size
  validates :name, presence: true

  enum status: {  '新品未使用': 1, '未使用に近い': 2, '目立った傷や汚れなし': 3,
                 'やや傷や汚れあり': 4, '傷や汚れあり': 5, '全体的に状態が悪い': 6 }
  enum shipping_from: {
    '北海道': 1, '青森': 2, '岩手': 3, '宮城': 4, '秋田': 5, '山形': 6, '福島': 7,
      '茨城': 8, '栃木': 9, '群馬': 10, '埼玉': 11, '千葉': 12, '東京': 13, '神奈川': 14,
      '新潟': 15, '富山': 16, '石川': 17, '福井': 18, '山梨': 19, '長野': 20,
      '岐阜': 21, '静岡': 22, '愛知': 23, '三重': 24,
      '滋賀': 25, '京都': 26, '大阪': 27, '兵庫': 28, '奈良': 29, '和歌山': 30,
      '鳥取': 31, '島根': 32, '岡山': 33, '広島': 34, '山口': 35,
      '徳島': 36, '香川': 37, '愛媛': 38, '高知': 39,
      '福岡': 40, '佐賀': 41, '長崎': 42, '熊本': 43, '大分': 44, '宮崎': 45, '鹿児島': 46,
      '沖縄': 47, '未定': 48
  }
end
