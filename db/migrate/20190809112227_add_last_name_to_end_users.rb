class AddLastNameToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :last_name, :string, null: false
    add_column :end_users, :first_name, :string, null: false, default: ""
    add_column :end_users, :last_kana, :string, null: false, default: ""
    add_column :end_users, :first_kana, :string, null: false, default: ""
    add_column :end_users, :last_name, :string, null: false, default: ""
    add_column :end_users, :address, :string, null: false, default: ""
    add_column :end_users, :postal_code, :string, null: false, default: ""
    add_column :end_users, :phone_number, :string, null: false, default: ""
    add_column :end_users, :left_at, :datetime, null: false
  end
end
