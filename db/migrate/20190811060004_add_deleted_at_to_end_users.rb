class AddDeletedAtToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :deleted_at, :datetime
    add_index :end_users, :deleted_at
  end
end
# paranoia：論理削除を指定するモデルに削除用のカラムの追加と、定義を追加
