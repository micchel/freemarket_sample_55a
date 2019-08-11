class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :residence
  accepts_nested_attributes_for :residence
  has_many :items, dependent: :destroy, foreign_key: "seller_id"
  # has_secure_password validations: false
end
