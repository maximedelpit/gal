ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :email, :first_name, :last_name, :location, :job_title, :phone_number,
                :company, :state, :language, :industry_id, :admin, :linkedin_email,
                :picture_url, :linkedin_url, :accepts_tos, :nl_subscription,
                tag_list: [], prospect_area_ids: [], industry_subcategory_ids: []
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  controller do
    # clear blank attr on save
    def save_resource(object)
      permitted_params[object.class.name.underscore].select {|k, v| v.blank?}.keys.each {|a| object.send("#{a}=", nil)}
      super
    end
  end

  form do |f|
    f.inputs  :admin, :email, :first_name, :last_name, :location, :job_title, :phone_number,
              :company, :state, :language, :linkedin_email, :picture_url, :linkedin_url, :accepts_tos, :nl_subscription
    f.inputs do
      f.input :prospect_area_ids, collection: ProspectArea.all,
            label_method: :name, value_method: :id, input_html: {class: 'select2', multiple: true}
      f.input :industry_subcategory_ids, collection: IndustrySubcategory.all,
            label_method: :name, value_method: :id, input_html: {class: 'select2', multiple: true}
      f.input :tag_list, collection: ActsAsTaggableOn::Tag.pluck(:name), input_html: { value: params[:lead]&.send(:[], :tag_list), class: 'select2', multiple: true}
    end
    f.button 'OK'
  end
end
