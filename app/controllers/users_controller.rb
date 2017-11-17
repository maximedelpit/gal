class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
    authorize @user
  end

  def update_password
    @user = current_user
    authorize @user
    check_password
    u_params = user_params
    u_params[:nl_subscription] = false if u_params[:nl_subscription].nil?
    if @user.update(user_params)
      # Sign in the user by passing validation in case their password changed
      bypass_sign_in(@user)
      redirect_to root_path
    else
      render "edit"
    end
  end

  private


  def check_password
    if params[:password].present? && params[:password] != params[:password_confirmation]
      @user.errors.add :password, "Password & password confoirmation does not match"
    else
      @user.errors.add :password, "You must set your own password"
    end
  end

  def user_params
    # NOTE: Using `strong_parameters` gem
    sanitize_collection_params(:user)
    params.require(:user).permit(
          :email, :password, :password_confirmation, :current_password, :first_name,
          :last_name, :language, :location, :job_title, :phone_number, :company,
          :industry_id, :nl_subscription, :accepts_tos,
          {prospect_area_ids: [], industry_subcategory_ids: [], tag_ids: []}
    )
  end
end
