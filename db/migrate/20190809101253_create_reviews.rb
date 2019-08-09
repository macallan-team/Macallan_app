class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :item_id, null: false, defalut: ""
      t.integer :end_user_id, null: false, defalut: ""
      t.string :name, null: false, defalut: ""
      t.text :comment, null: false, defalut: ""

      t.timestamps
    end
  end
end
