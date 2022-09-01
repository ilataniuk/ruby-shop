class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  validates :cnt, numericality: { greater_than:0 }

  def row_amount
      price * cnt
  end
end
