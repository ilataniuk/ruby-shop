class ChangeOrderItemsDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default :order_items, :cnt, from: nil, to: 1
  end
end
