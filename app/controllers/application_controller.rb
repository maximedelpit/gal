class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_up_path_for(resource)
    edit_user_registration
  end

  protected

    def configure_permitted_parameters
      # devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :first_name, :last_name, :location, :industry, :position, :phone_number])
      devise_parameter_sanitizer.permit(:account_update, keys: [:email, :first_name, :last_name, :location, :industry, :position, :phone_number])
    end
end
