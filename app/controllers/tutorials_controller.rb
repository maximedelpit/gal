class TutorialsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @tutorials = policy_scope(Tutorial.order(:created_at))
  end

  def show
    @tutorial = Tutorial.find(params[:id])
    authorize @tutorial
  end
end
