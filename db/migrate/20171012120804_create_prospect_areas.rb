class CreateProspectAreas < ActiveRecord::Migration[5.1]
  def change
    create_table :prospect_areas do |t|
      t.string :country
      t.string :region
      t.string :zipcode
      t.string :city
      t.string :category

      t.timestamps
    end
  end
end
