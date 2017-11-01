class CreateZones < ActiveRecord::Migration[5.1]
  def change
    create_table :zones do |t|
      t.references :user, foreign_key: true
      t.references :prospect_area, foreign_key: true

      t.timestamps
    end
  end
end
