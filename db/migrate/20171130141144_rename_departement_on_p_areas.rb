class RenameDepartementOnPAreas < ActiveRecord::Migration[5.1]
  def change
    rename_column :prospect_areas, :departement, :department
  end
end
