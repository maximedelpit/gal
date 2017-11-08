ActiveAdmin.register Lead do
  permit_params :first_name, :last_name, :company, :company_size, :location, :job_title,
              :phone, :mail, :linkedin_url, :nature, :state, :deadline, :within,
              :description, :user_id, :price
end
