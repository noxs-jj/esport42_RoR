class Backoffice::EventController < Backoffice::ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    if @event.nil?
      redirect_to backoffice_event_index_path, alert: "Event #{params[:id].to_s} doesn't exist"
    end
  end

  def new
    @event = Event.new
  end

  def create
    event = Event.new(event_params)
    event.created_by = current_user.id
    event.save
    if event
      redirect_to backoffice_user_show_path(event.id), notice: "Register success"
    else
      redirect_to request.headers["HTTP_REFERER"], alert: "Register failed, plz contact admin"
    end
  end

  def edit
    @event = Event.find(params[:id])
    if @event.nil?
      redirect_to backoffice_event_index_path, alert: "Event #{params[:id].to_s} doesn't exist"
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.nil?
      redirect_to backoffice_event_index_path, alert: "Event #{params[:id].to_s} doesn't exist"
    else
      if @event.update(event_params)
        redirect_to backoffice_event_show_path(@event.id), notice: "update Success"
      else
        redirect_to backoffice_event_index_path, alert: "Failed to update event."
      end
    end
  end

  def delete
  end

  private
	  def event_params
	    params.require(:event).permit(
        :name, :info, :games_ids, :tournament_ids, :participant_ids,
        :date, :adress_line2, :adress_line3, :adress_city, :adress_province,
        :adress_postalcode, :adress_country, :adress_otherDetails
			)
	  end
end
