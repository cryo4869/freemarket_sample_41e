require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'
class Image < ApplicationRecord
  mount_uploader :image, ImagesUploader
  belongs_to :product, optional: true
end
