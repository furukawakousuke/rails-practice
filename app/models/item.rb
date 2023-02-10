class Item < ApplicationRecord
  has_one_attached :image
  
  belongs_to :genre
  
  has_many :cart_items,dependent: :destroy
  has_many :order_details,dependent: :destroy
  
  enum is_active: { sale: true, stop: false }
  
  def zeikomi
    (price * 1.10).round(0)
  end
  
  def goukei
    (zeikomi + 800)
  end
  
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  
end
