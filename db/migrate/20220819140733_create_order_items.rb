class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.string :name
      t.decimal :price
      t.integer :cnt

      t.timestamps
    end
  end
end
