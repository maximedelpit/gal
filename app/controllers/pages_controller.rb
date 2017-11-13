class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  # layout 'no_flex_layout'

  def home
  end
end
