class AddBuildStateToLeads < ActiveRecord::Migration[5.1]
  def change
    add_column :leads, :build_status, :string
  end
end
