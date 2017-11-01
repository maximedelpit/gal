class AddColsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :location, :string
    add_column :users, :job_title, :string
    add_column :users, :phone_number, :string
    add_column :users, :company, :string
    add_column :users, :state, :string
    add_column :users, :language, :string
    add_reference :users, :industry, foreign_key: true
    add_reference :users, :subcategory, foreign_key: true
    add_column :users, :admin, :boolean, null: false, default: false
  end
end
