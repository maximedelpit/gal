module ApplicationHelper

  def gtm_suffix_link
    if params[:controller] == 'devise/sessions' && params[:action] == 'new'
      return '-login'
    elsif params[:controller] == 'devise/registrations' && params[:action] == 'new'
      return '-signup'
    else
      return '-other'
    end
  end
end
