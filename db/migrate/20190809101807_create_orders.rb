class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id, null: false, defalut: ""
      t.datetime :purchased_at, null: false, defalut: ""
      t.integer :shipping_status, null: false, defalut: 0
      t.integer :total_price, null: false, defalut: ""
      t.integer :payment, null: false
      t.integer :subtotal, null:false, default:""
      t.string :shipping_name, null: false, default: ""
      t.string :shipping_phone_number,null: false, default: ""
      t.string :shipping_address, null: false, default: ""
      t.string :shipping_postal_code, null: false,default: ""
      t.integer :tax_rate, null: false,default:""
      t.integer :carriage_rate, null: false, default:""

      t.timestamps
    end
  end
end
