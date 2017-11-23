class AddPriceToPropositions < ActiveRecord::Migration[5.1]
  def change
    add_column :propositions, :price, :float
  end
end
