class CreateTaxes < ActiveRecord::Migration[5.2]
  def change
    create_table :taxes do |t|
      t.decimal :rate, precision: 6, scale: 3
      t.integer :valid_flag, null: false,default: 0,index: true
      t.timestamps
    end
  end
end
