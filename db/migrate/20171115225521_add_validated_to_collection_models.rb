class AddValidatedToCollectionModels < ActiveRecord::Migration[5.1]
  def change
    add_column :prospect_areas, :validated, :boolean
    add_column :tags, :validated, :boolean
  end
end
