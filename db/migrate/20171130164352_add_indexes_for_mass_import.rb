class AddIndexesForMassImport < ActiveRecord::Migration[5.1]
  def change
    add_index :industry_subcategories, :name, unique: true
    add_index :prospect_areas, :name, unique: true
  end
end
