class AddNameToProspectArea < ActiveRecord::Migration[5.1]
  def change
    add_column :prospect_areas, :name, :string
  end
end
