class CreateLeadStepsController < ApplicationController
  skip_before_action :reset_lead_session
  include Wicked::Wizard
  steps :context, :description, :company, :contact, :checkout
  before_action :set_lead

  def show
    authorize @lead, :create?
    # @propositions = @lead.propositions.build
    if !@lead.is_private && step == :checkout
      skip_step
    end
    render_wizard #(nil, {}, { lead_id: @lead.id })
  end

  def update
    authorize @lead, :update?
    @lead.assign_attributes(lead_params)
    @lead.build_status = "#{step}"
    if step == steps.last || (step == :contact && !@lead.is_private)
      @lead.build_status = 'active'
      @lead.state ||= 'created'
    elsif step == steps.first && @lead.for_my_self
      fill_for_my_self_infos
    end
    # @propositions = @lead.propositions
    @lead.save
    session[:lead_id] = @lead.id
    # if last step & lead valid => we reset session
     render_wizard @lead # (@lead, {}, { lead_id: @lead.id })
   end

  private

  def finish_wizard_path
    if @lead.valid?
      session[:lead_id] = nil
      lead_path(@lead)
    else
      redirect_to wizard_path
    end
  end

  def lead_params
    params.require(:lead).permit(:first_name, :last_name, :company, :company_size, :within,
      :location, :job_title, :phone, :mail, :linkedin_url, :description, :price,
      :is_private, :share_to, :for_my_self, :offer_limit, tag_list: [])
  end

  def set_lead
    return @lead = session[:lead_id] ? Lead.find(session[:lead_id]) : Lead.new(price: 30, user: current_user, for_my_self: true)
  end

  def fill_for_my_self_infos
    @lead.first_name ||= current_user.first_name
    @lead.last_name ||= current_user.last_name
    @lead.company ||= current_user.company
    # @lead.company_size ||= current_user.company_size
    @lead.location ||= current_user.location
    @lead.job_title ||= current_user.job_title
    @lead.phone ||= current_user.phone_number
    @lead.mail ||= current_user.email
  end
end
