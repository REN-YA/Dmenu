class ChangeCloumnsNotnullAddStores < ActiveRecord::Migration[5.2]
  def change
    change_column :stores, :name, :string, null: false
    change_column :stores, :email, :string, null: false
    change_column :stores, :password_digest, :string, null: false
  end
end
