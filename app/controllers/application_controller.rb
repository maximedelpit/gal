class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  before_action :reset_lead_session
  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  def after_sign_up_path_for(resource)
    edit_user_path
  end

  def after_sign_in_path_for(resource)
    if resource.state != 'registered'
      edit_user_path
    else
      root_path
    end
  end

  def default_url_options
    { locale: I18n.locale == I18n.default_locale ? nil : I18n.locale }
  end

  def sanitize_collection_params(key, associations=%i(industry_subcategory_ids prospect_area_ids tag_ids))
    return if key.nil?
    associations.each do |as|
      params[key][as]&.map! do |v|
        if v.to_i == 0 && v.present?
          klass = as.to_s.classify.gsub(/^(.+)(Id)$/, '\1')
          klass = "ActsAsTaggableOn::Tag" if klass == 'Tag'
          klass.constantize.where(name: v.capitalize.singularize).first_or_create(validated: false).id
        else
          v
        end
      end
    end
    return params
  end

  def reset_lead_session
    # always run unless on create_lead controller
    session[:lead_id] = nil unless params[:controller] == 'create_lead_steps'
  end

  def set_locale
    if current_user&.language
      loc = current_user.language
    elsif request.env['HTTP_ACCEPT_LANGUAGE'].present?
      first_browser_loc = request.env['HTTP_ACCEPT_LANGUAGE'].split(',').first.split('-').first
      loc = first_browser_loc == 'fr' ? 'fr' : 'en'
    else
      loc = I18n.default_locale
    end
    I18n.locale = params.fetch(:locale, loc).to_sym
  end

  def user_not_authorized
    
    if user_signed_in? && current_user.state == 'linkedin_ok'
      flash[:alert] = I18n.t(:missing_info_for_registered)
      redirect_to edit_user_path
    else
      flash[:alert] = "Access forbidden"
      redirect_to root_path
    end  
  end

  protected

  def configure_permitted_parameters
    sanitize_collection_params(:user) if %w(update create).include?(params[:action])
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(
        :email, :password, :password_confirmation, :current_password, :first_name,
        :last_name, :language, :location, :job_title, :phone_number, :company,
        :industry_id, :nl_subscription, :accepts_tos, :publish_for_myself, :publish_for_others, :get_clients,
        {prospect_area_ids: [], industry_subcategory_ids: [], tag_ids: []}
      )
    end
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
