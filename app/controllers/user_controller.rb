class UserController < ApplicationController
  include ParticipantHelper
  load_and_authorize_resource

  def show
    @user = User.find_by(id: params[:id])
    if @user.nil?
      redirect_to root_path, alert: "User #{params[:id].to_s} doesn't exist"
    else
      @participants = participantHelper_list_participants_where_user_is_registered(current_user.id)
      @events = participantHelper_list_event_from_participants_array(@participants)
      @tournaments = participantHelper_list_tournament_from_participants_array(@participants)
    end
  end
end
