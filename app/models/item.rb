class Item < ApplicationRecord
  belongs_to :user
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  enum status: { new_thing: 0, near_unused: 1, no_damage: 2, little_damage: 3, damage: 4, bad_thing: 5 }
  enum delivery_cost: { postage_included: 0, cash_on_delivery: 1 }
  enum delivery_way: { undecided: 0, mercari_bin: 1, yu_mail: 2, letter_pack: 3, regular_mail: 4, kuroneko: 5, yu_pack: 6, click_post: 7, yu_packet: 8 }
  enum delivery_date: { ship_in_1to2days: 0, ship_in_2to3days: 1, ship_in_4to7days:2 }

  validates :name, presence: true, length: { maximum: 40 }
  validates :explain, presence: true, length: { maximum: 1000}
  validates :category_id, presence: true
  validates :status, presence: true
  validates :delivery_cost, presence: true
  validates :delivery_way, presence: true
  validates :delivery_prefecture, presence: true
  validates :delivery_date, presence: true
  validates :price, presence: true, inclusion: { in: (300..9999999)}
  
  def previous
    Item.order('created_at desc, id desc').where('created_at <= ? and id < ?', created_at, id).first
  end

  def next
    Item.order('created_at desc, id desc').where('created_at >= ? and id > ?', created_at, id).reverse.first
  end 
end
