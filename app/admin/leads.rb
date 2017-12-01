ActiveAdmin.register Lead do

  permit_params :first_name, :last_name, :company, :company_size, :location, :job_title,
              :phone, :mail, :linkedin_url, :is_private, :share_to, :state, :deadline, :within,
              :description, :user_id, :price, tag_list: []

  controller do
    # clear blank attr on save
    def save_resource(object)
      permitted_params[object.class.name.underscore].select {|k, v| v.blank?}.keys.each {|a| object.send("#{a}=", nil)}
      super
    end
  end

  form do |f|
    f.inputs do
      f.input :user_id, as: :select, collection: User.all.map{|u| ["#{u.last_name}, #{u.first_name}", u.id]}
      f.input :state, as: :select, collection: Lead::STATES
    end
    f.inputs do
      f.input :description
      f.input :within, as: :select, collection: t(Lead::WITHIN, scope: 'lead.WITHIN').zip(Lead::WITHIN)
      f.input :tag_list, collection: user_tags_collection.pluck(:name), input_html: { value: params[:lead]&.send(:[], :tag_list), class: 'select2', multiple: true}
    end
    f.inputs do
      f.input :company
      f.input :company_size, as: :select, collection: Lead::COMPANY_SIZES
      f.input :location
    end
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :mail
      f.input :phone
      f.input :job_title
      f.input :linkedin_url
    end
    f.inputs do
      f.input :is_private
      f.input :share_to
      f.input :price
    end
    f.actions
  end


  index do
    id_column
    [:first_name, :last_name, :company, :company_size, :location, :job_title,
     :phone, :mail, :linkedin_url, :is_private, :share_to, :state, :deadline, :within,
      :description, :user_id, :price, :created_at, :updated_at].each do |_attr|
      column _attr
    end
    column :tags do |u|
      u.send(:tags).pluck(:name).join(' / ')
    end
    actions
  end
end
