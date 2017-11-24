class AddShareToRemoveNatureAddPrivateToLeads < ActiveRecord::Migration[5.1]
  def change
    add_column :leads, :share_to, :string
    remove_column :leads, :nature, :string
    add_column :leads, :is_private, :boolean
  end
end
