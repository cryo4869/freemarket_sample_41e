class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :address, dependent: :destroy
  has_one :credit
  has_many :products
  # accepts_nested_attributes_for :address
  enum expire_mm: {  '01': 1, '02': 2, '03': 3, '04': 4, '05': 5, '06': 6, '07': 7,
                  '08': 8, '09': 9, '10': 10, '11': 11, '12': 12 }
  enum expire_yy: {  '19': "2019", '2020': "2020", '21': "2021", '22': "2022", '23': "2023", '24': "2024", '25': "2025",
                     '26': "2026", '27': "2027", '28': "2028", '29': "2029" }
end
