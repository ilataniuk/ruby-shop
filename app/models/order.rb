class Order < ApplicationRecord

  has_many :order_items, dependent: :destroy

  enum status: %i[in_prorgess ordered payed canceled]

  def total_amount
    order_items.map(&:row_amount).flatten.sum
  end
end
