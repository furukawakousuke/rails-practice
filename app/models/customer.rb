class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_one_attached :image
         
         has_many :addresses,dependent: :destroy
         has_many :cart_items,dependent: :destroy
         has_many :orders,dependent: :destroy
end
