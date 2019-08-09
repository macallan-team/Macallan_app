class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :label_id
      t.integer :category_id
      t.string :album
      t.string :image_id
      t.integer :price
      t.integer :stock
      t.integer :sales_status

      t.timestamps
    end
  end
end
