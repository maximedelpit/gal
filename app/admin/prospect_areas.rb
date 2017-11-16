ActiveAdmin.register ProspectArea do

  permit_params :region, :zipcode, :departement, :category, :validated

  controller do
    # clear blank attr on save
    def save_resource(object)
      permitted_params[object.class.name.underscore].select {|k, v| v.blank?}.keys.each {|a| object.send("#{a}=", nil)}
      super
    end
  end
end
