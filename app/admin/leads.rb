ActiveAdmin.register Lead do

  permit_params :first_name, :last_name, :company, :company_size, :location, :job_title,
              :phone, :mail, :linkedin_url, :is_private, :state, :deadline, :within,
              :description, :user_id, :price
  controller do
    # clear blank attr on save
    def save_resource(object)
      permitted_params[object.class.name.underscore].select {|k, v| v.blank?}.keys.each {|a| object.send("#{a}=", nil)}
      super
    end
  end
end
