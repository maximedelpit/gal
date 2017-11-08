ActiveAdmin.register Proposition do

  permit_params :mail, :state, :click_to_buy, :private, :user_id, :lead_id
end
