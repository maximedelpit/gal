ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :email, :first_name, :last_name, :location, :job_title, :phone_number,
              :company, :state, :language, :industry_id, :subcategory_id, :admin,
              :linkedin_email, :provider, :picture_url, :linkedin_url, :accepts_tos, :nl_subscription
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

form do |f|
  f.inputs :email, :first_name, :last_name, :location, :industry, :position, :phone_number, :admin, :password
  f.button 'OK'
end

end
