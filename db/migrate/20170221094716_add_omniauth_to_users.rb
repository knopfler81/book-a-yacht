class AddOmniauthToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :avatar, :string
    add_column :users, :token, :string
    add_column :users, :token_expiry, :datetime
  end
end
