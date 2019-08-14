class CreateDiscs < ActiveRecord::Migration[5.2]
  def change
    create_table :discs do |t|
      t.integer :item_id, null: false, defalut: ""
      t.integer :flag

      t.timestamps
    end
  end
end
