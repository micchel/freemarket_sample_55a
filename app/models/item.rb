class Item < ApplicationRecord
  belongs_to :user
  has_many :item_images, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
