class Size < ApplicationRecord
  acts_as_tree order: 'size'
  has_many :products
end
