class CreateCarriages < ActiveRecord::Migration[5.2]
  def change
    create_table :carriages do |t|
      t.integer :rate, null: false, default:""

      t.timestamps
    end
  end
end
