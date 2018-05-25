# NB: Quick & Dirty way of handling errors
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def linkedin
    begin
      login_from_linkedin
    rescue => e
      error_message = "#{e.class}\n => #{e.message}"
      Rails.logger.error(error_message)
      Rollbar.error(error_message) if Rails.env == 'production'
    end
  end

  def failure
    error_message = "#{OmniAuth::Utils.camelize(failed_strategy.name)}\n #{failure_message}"
    Rails.logger.error(error_message)
    Rollbar.error(error_message) if Rails.env == 'production'
    super
  end

  def login_from_linkedin
    user = User.find_for_linkedin_oauth(request.env['omniauth.auth'])
    if user.persisted?
      sign_in_and_redirect user, event: :authentication
      set_flash_message(:notice, :success, kind: 'Linkedin') if is_navigational_format?
    else
      session['devise.linkedin_data'] = request.env['omniauth.auth'].except('extra')
      redirect_to new_user_registration_url
    end
  end
end
