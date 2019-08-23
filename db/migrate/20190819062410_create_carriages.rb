class CreateCarriages < ActiveRecord::Migration[5.2]
  def change
    create_table :carriages do |t|
      t.integer :rate, null: false, default:""
      t.integer :valid_flag, null: false,default: 0,index: true

      t.timestamps
    end
  end
end
