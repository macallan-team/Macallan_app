class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :order_id, null: false, defalut: ""
      t.integer :item_id, null: false, defalut: ""
      t.integer :price, null: false, defalut: ""
      t.integer :count, null: false, defalut: ""

      t.timestamps
    end
  end
end
