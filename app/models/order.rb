class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details,dependent: :destroy

  enum payment_method: {credit_card: 0, bank: 1}

  enum status: {waiting:0,confirmation:1,production:2,sending:3,arrived:4 }
  
  def excluded
   total_payment - 800
  end

end
