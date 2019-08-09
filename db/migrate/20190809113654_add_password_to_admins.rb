class AddPasswordToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :password, :string, null: false, default: ""
  end
end
