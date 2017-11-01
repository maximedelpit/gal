class CreateIndustries < ActiveRecord::Migration[5.1]
  def change
    create_table :industries do |t|
      t.string :name
      t.string :linkedin_code

      t.timestamps
    end
  end
end
