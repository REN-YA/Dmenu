class RenameEncryptedPasswordColumnToStores < ActiveRecord::Migration[5.2]
  def change
    rename_column :stores, :encrypted_password, :password_digest
  end
end
