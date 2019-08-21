class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :label_id, null: false, defalut: ""
      t.integer :category_id, null: false, defalut: ""
      t.string :album, null: false, defalut: ""
      t.string :image_id, defalut: ""
      t.integer :price, null: false, defalut: ""
      t.integer :stock, null: false, defalut: ""
      t.integer :sales_status, null: false, defalut: ""
      t.date :release_date, null: false, dafault: ""
      t.integer :artist_id, null: false, defalut: ""

      t.timestamps
    end
  end
end
