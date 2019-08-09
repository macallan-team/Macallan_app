class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :end_user_id, null: false, defalut: ""
      t.string :name, null: false, defalut: ""
      t.string :address, null: false, defalut: ""
      t.string :postal_code, null: false, defalut: ""
      t.string :phone_number, null: false, defalut: ""

      t.timestamps
    end
  end
end
