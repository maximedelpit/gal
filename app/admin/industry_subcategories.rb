ActiveAdmin.register IndustrySubcategory do
  active_admin_import(
    csv_options: { col_sep: ';'},
    validate: false,
    on_duplicate_key_update: {conflict_target: [:name], columns: [:validated]},
    template_object: ActiveAdminImport::Model.new(
      force_encoding: :auto,
      hint: I18n.t('active_admin.industry_subcategories.csv_guidelines_html'),
    )
  )

  permit_params :name, :validated, :tag_ids

  batch_action :validate_selected do |ids|
    batch_action_collection.find(ids).each do |resource|
      resource.validate!
    end
    redirect_to collection_path, alert: "Resource marked as valid"
  end

  batch_action :unvalidate_selected do |ids|
    batch_action_collection.find(ids).each do |resource|
      resource.unvalidate!
    end
    redirect_to collection_path, alert: "Resource marked as invalid"
  end


  controller do
    # clear blank attr on save
    def save_resource(object)
      permitted_params[object.class.name.underscore].select {|k, v| v.blank?}.keys.each {|a| object.send("#{a}=", nil)}
      super
    end
  end
  form do |f|
    f.inputs :name, :validated, :tag_ids
    f.button 'OK'
  end
end
