class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.integer :disc_id, defalut: ""
      t.integer :artist_id,  defalut: ""
      t.string :name, defalut: ""
      t.integer :song_order, defalut: ""

      t.timestamps
    end
  end
end
