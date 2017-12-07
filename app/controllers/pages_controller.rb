class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:start]

  # layout 'no_flex_layout'

  def start
    params[:has_registered] = session[:has_registered]
    session[:has_registered] = nil
  end
end
