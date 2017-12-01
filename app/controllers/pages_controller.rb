class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  # layout 'no_flex_layout'

  def home
    params[:has_registered] = session[:has_registered]
    session[:has_registered] = nil
  end
end
