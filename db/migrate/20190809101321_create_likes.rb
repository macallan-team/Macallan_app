class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :item_id, null: false, defalut: ""
      t.integer :end_user_id, null: false, defalut: ""

      t.timestamps
    end
  end
end
