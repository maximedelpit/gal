class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  def after_sign_up_path_for(resource)
    edit_user_registration_path
  end

  def after_sign_in_path_for(resource)
    if resource.state != 'registered'
      edit_user_registration_path
    else
      new_lead_path
    end
  end

  def default_url_options
    if current_user&.language
      { locale: current_user.language }
    else
      { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
    end
  end

  def set_locale
    I18n.locale = params.fetch(:locale, I18n.default_locale).to_sym
  end

  def user_not_authorized
    flash[:alert] = "Access forbidden"
    redirect_to root_path
  end

  protected

    def configure_permitted_parameters
      # devise_parameter_sanitizer.permit(:sign_up, keys: [:nl_subscriptions, :accepts_term_of_sales])
      devise_parameter_sanitizer.permit(:account_update, keys: [
        :email, :password, :password_confirmation, :current_password, :first_name,
        :last_name, :language, :location, :job_title, :phone_number, :company,
        :industry_id, :subcategories, :tag_list, :nl_subscription, :accepts_tos
      ])
    end

    def skip_pundit?
      devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
    end
end
