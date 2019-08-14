class CreateCosts < ActiveRecord::Migration[5.2]
  def change
    create_table :costs do |t|
      t.integer :tax, null: false
      t.integer :carriage, null: false

      t.timestamps
    end
  end
end
