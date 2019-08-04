class Item < ApplicationRecord
  belongs_to :user
  has_many :item_images, dependent: :destroy
  belongs_to :user
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  enum status: { "新品、未使用": 0, "未使用に近い": 1, "目立った傷や汚れなし": 2, "やや傷や汚れあり": 3, "傷や汚れあり": 4, "全体的に状態が悪い": 5 }
  enum delivery_cost: { "送料込み(出品者負担)": 0, "着払い(購入者負担)": 1 }
  enum delivery_date: { "1~2日で発送": 0, "2~3日で発送": 1, "4~7日で発送":2 }
end
