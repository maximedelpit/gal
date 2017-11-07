class AddNAndCgvBooleanToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :accepts_tos, :boolean
    add_column :users, :nl_subscription, :boolean
  end
end
