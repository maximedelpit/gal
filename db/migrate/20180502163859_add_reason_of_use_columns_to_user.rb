class AddReasonOfUseColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :publish_for_myself, :boolean
    add_column :users, :publish_for_others, :boolean
    add_column :users, :get_clients, :boolean
  end
end
