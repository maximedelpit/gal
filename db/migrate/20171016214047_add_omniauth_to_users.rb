class AddOmniauthToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :linkedin_email, :string
    add_column :users, :provider, :string
    add_column :users, :picture_url, :string
    add_column :users, :uid, :string
    add_column :users, :linkedin_url, :string
    add_column :users, :token_expiry, :datetime
    add_column :users, :token, :string
  end
end
