ActiveAdmin.register Proposition do

  permit_params :mail, :state, :click_to_buy, :private, :user_id, :lead_id

  controller do
    # clear blank attr on save
    def save_resource(object)
      permitted_params[object.class.name.underscore].select {|k, v| v.blank?}.keys.each {|a| object.send("#{a}=", nil)}
      super
    end
  end
end
