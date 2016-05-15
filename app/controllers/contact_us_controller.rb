class ContactUsController < ApplicationController
	def new
		@contactUs = ContactUs.new
	end

  def create
		@contact = ContactUs.new(contact_us_params)
		if !@contact.save
			redirect_to main_app.contact_us_path, alert: "Contact form not saved, contact Administratior"
		else
			redirect_to main_app.root_path, notice: "Contact stored success !!"
		end
  end

	private
	  def contact_us_params
	    params.require(:contact_us).permit(
				:nickname, :first_name, :last_name, :email, :phone, :entity, :object,
				:message, :other, :adress_line1, :adress_line2, :adress_line3,
				:adress_city, :adress_province, :adress_postalcode, :adress_country,
				:adress_otherDetails,
			)
	  end
end
