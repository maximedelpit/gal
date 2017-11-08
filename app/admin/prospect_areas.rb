ActiveAdmin.register ProspectArea do
  permit_params :country, :region, :zipcode, :city, :category
end
