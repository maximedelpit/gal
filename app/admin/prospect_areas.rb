ActiveAdmin.register ProspectArea do

  permit_params :region, :zipcode, :departement, :category, :validated

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
