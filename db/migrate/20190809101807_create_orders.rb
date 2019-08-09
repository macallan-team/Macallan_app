class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :address_id, null: false, defalut: ""
      t.integer :end_user_id, null: false, defalut: ""
      t.datetime :purchased_at, null: false, defalut: ""
      t.integer :shipping_status, null: false, defalut: ""
      t.integer :total_price, null: false, defalut: ""

      t.timestamps
    end
  end
end
