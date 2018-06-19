class LeadsController < BusinessController
  def new
    @lead = Lead.new(price: 30, user: current_user, build_status: 'active')
    authorize @lead
  end

  def create
    @lead = Lead.new(lead_params)
    authorize @lead
    @lead.user = current_user
    # @lead.tag_list = params[:lead][:tag_list].reject {|t| t.blank?}
    @lead.price ||= 30
    @lead.state ||= 'created'
    if @lead.save
      # redirect_to create_lead_step_path(lead_id: @lead.id), success: 'Congrats!'
      redirect_to lead_path(@lead), success: 'Congrats!'
    else
      render :new
    end
  end

  def show
    @lead = Lead.find(params[:id])
    authorize @lead
  end

  private

  def lead_params
    params.require(:lead).permit(:first_name, :last_name, :company, :company_size, :within,
      :location, :job_title, :phone, :mail, :linkedin_url, :description, :price, tag_list: [])
  end
end
