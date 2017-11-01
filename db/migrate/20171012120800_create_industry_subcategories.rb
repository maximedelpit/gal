class CreateIndustrySubcategories < ActiveRecord::Migration[5.1]
  def change
    create_table :industry_subcategories do |t|
      t.string :name
      t.string :validated
      # t.references :industry, foreign_key: true # should connect indu / indu_subs?

      t.timestamps
    end
  end
end
