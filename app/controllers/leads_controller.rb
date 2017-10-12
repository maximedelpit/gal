class LeadsController < ApplicationController

  def new
    @lead = Lead.new(price: 30)
  end

  def create
    @lead = Lead.new(lead_params)
    @lead.user = current_user
    @lead.user.tag_list = params[:lead][:tag_list]
    @lead.price ||= 30
    if @lead.save
      render 'pages/success', lead: @lead, user: current_user
    else
      render :new
    end
  end

  private

  def lead_params
    params.require(:lead).permit(:first_name, :last_name, :company, :company_size,
      :location, :job_title, :phone, :mail, :linkedin_url, :description, :price, tag_list: [])
  end
end
