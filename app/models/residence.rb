class Residence < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to_active_hash :prefecture
belongs_to :user, optional: true

validates :post_code, presence: true
validates :prefecture_id, presence: true
validates :city, presence: true
validates :address, presence: true
end
