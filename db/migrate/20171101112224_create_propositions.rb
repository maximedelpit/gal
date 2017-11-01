class CreatePropositions < ActiveRecord::Migration[5.1]
  def change
    create_table :propositions do |t|
      t.string :mail
      t.string :state
      t.boolean :click_to_buy
      t.boolean :private, default: :false
      t.references :user, foreign_key: true
      t.references :lead, foreign_key: true

      t.timestamps
    end
  end
end
