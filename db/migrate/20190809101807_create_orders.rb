class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :address_id
      t.integer :end_user_id
      t.datetime :purchased_at
      t.integer :shipping_status
      t.integer :total_price

      t.timestamps
    end
  end
end
