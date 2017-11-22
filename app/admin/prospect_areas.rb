ActiveAdmin.register ProspectArea do
  active_admin_import(
    csv_options: { col_sep: ';'},
    validate: false,
    on_duplicate_key_update: {conflict_target: [:country, :region, :zipcode, :department, :category], columns: [ :validated ]},
    template_object: ActiveAdminImport::Model.new(
      force_encoding: :auto,
      hint: "Le csv doit comporter les champs: id, name, validated (laisser id vide si creation)",
    )
  )

  permit_params :country, :region, :zipcode, :departement, :category, :validated

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
end
