ActiveAdmin.register IndustrySubcategory do

  permit_params :name, :validated, :tag_ids

  form do |f|
    f.inputs :name, :validated, :tag_ids
    f.button 'OK'
  end

  controller do
    # clear blank attr on save
    def save_resource(object)
      permitted_params[object.class.name.underscore].select {|k, v| v.blank?}.keys.each {|a| object.send("#{a}=", nil)}
      binding.pry
      super
    end
  end
end
