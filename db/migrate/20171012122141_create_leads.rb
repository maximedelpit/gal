class CreateLeads < ActiveRecord::Migration[5.1]
  def change
    create_table :leads do |t|
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :company_size
      t.string :location
      t.string :job_title
      t.string :phone
      t.string :mail
      t.string :linkedin_url
      t.string :nature
      t.string :state
      t.date :deadline
      t.string :within
      t.text :description
      t.references :user, foreign_key: true
      t.float :price

      t.timestamps
    end
  end
end
