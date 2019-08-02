class Item < ApplicationRecord
  belongs_to :user
  has_many :item_images, dependent: :destroy
  belongs_to :user
  belongs_to :category
end
