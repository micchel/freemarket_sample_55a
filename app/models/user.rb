class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :residence
  has_one :card
  accepts_nested_attributes_for :residence
  has_many :items, dependent: :destroy, foreign_key: "seller_id"
end
