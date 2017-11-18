# class Lead::BuildController < ApplicationController
#   include Wicked::Wizard

#   steps :description, :contact, :company, :checkout

#   def show
#     set_lead
#     authorize @lead, :new?
#     render_wizard
#   end


#   private

#   def set_lead
#     @lead = params[:lead_id].present? ? Lead.find(params[:lead_id]) : Lead.new(price: 30)
#   end
# end
