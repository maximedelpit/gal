class CreateSubcategories < ActiveRecord::Migration[5.1]
  def change
    create_table :subcategories do |t|
      t.references :user, foreign_key: true
      t.references :industry_subcategory, foreign_key: true

      t.timestamps
    end
  end
end
