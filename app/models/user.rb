class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :address, dependent: :destroy
  has_many :products
  # accepts_nested_attributes_for :address
  enum expire_mm: {  '01': 1, '02': 2, '03': 3, '04': 4, '05': 5, '06': 6, '07': 7,
                  '08': 8, '09': 9, '10': 10, '11': 11, '12': 12 }
  enum expire_yy: {  '19': 19, '20': 20, '21': 21, '22': 22, '23': 23, '24': 24, '25': 25,
                     '26': 26, '27': 27, '28': 28, '29': 29 }
end
