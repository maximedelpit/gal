class AddForMySelfToLeads < ActiveRecord::Migration[5.1]
  def change
    add_column :leads, :for_my_self, :boolean
    add_column :leads, :offer_limit, :integer
  end
end
