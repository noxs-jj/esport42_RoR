class EventController < ApplicationController
  load_and_authorize_resource
  def index
    @events = Event.all.order(created_at: :desc)
  end

  def show
    @event = Event.find_by(id: params[:id])
    if @event.nil?
      redirect_to event_index_path
    end
  end

	private
	  def event_params
	    params.require(:event).permit(
				:name, :games_ids, :tournament_ids,
				:participant_ids, :date, :adress_line2, :adress_line3, :adress_city,
				:adress_province, :adress_postalcode, :adress_country, :adress_otherDetails
			)
	  end
end
