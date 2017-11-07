class LeadsController < ApplicationController

  def new
    @lead = Lead.new(price: 30)
  end

  def create
    binding.pry
    @lead = Lead.new(lead_params)
    @lead.user = current_user
    @lead.user.tag_list = params[:lead][:tag_list]
    @lead.price ||= 30
    @lead.state ||= 'created'
    if @lead.save
      redirect_to success_lead_path(@lead)
    else
      render :new
    end
  end

  def show
    @lead = Lead.find(params[:id])
  end

  private

  def lead_params
    params.require(:lead).permit(:first_name, :last_name, :company, :company_size, :within,
      :location, :job_title, :phone, :mail, :linkedin_url, :description, :price, tag_list: [])
  end
end
