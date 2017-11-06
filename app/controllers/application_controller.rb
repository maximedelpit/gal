class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale


  def after_sign_up_path_for(resource)
    edit_user_registration_path
  end

  def after_sign_in_path_for(resource)
    edit_user_registration_path if resource.state != 'registered'
  end

  def set_locale
    I18n.locale = params.fetch(:locale, I18n.default_locale).to_sym
  end

  def default_url_options
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nl_subscriptions, :accepts_term_of_sales])
      devise_parameter_sanitizer.permit(:account_update, keys: [:email, :first_name, :last_name, :location, :industry, :position, :phone_number])
    end
end
