class RenameCityToDepOnProspectArea < ActiveRecord::Migration[5.1]
  def change
    rename_column :prospect_areas, :city, :departement
  end
end
